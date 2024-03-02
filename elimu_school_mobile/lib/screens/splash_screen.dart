import 'package:elimu_school_mobile/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      checkPasswordProtection();
    });
  }

  Future<void> checkPasswordProtection() async {
    final storage = const FlutterSecureStorage();
    final password = await storage.read(key: 'password');
    if (password != null) {
      // Si un mot de passe est enregistré, demandez-le à l'utilisateur
      showPasswordDialog();
    } 
    // else {
    //   // Sinon, naviguez vers l'écran de connexion
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const LoginScreen(),
    //     ),
    //   );
    // }
  }

  void showPasswordDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        String enteredPassword = '';
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Entrez le mot de passe pour continuer',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  enteredPassword = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  validatePassword(enteredPassword);
                },
                child: const Text('Valider'),
              ),
            ],
          ),
        );
      },
    );
  }

  void validatePassword(String enteredPassword) async {
    const storage = FlutterSecureStorage();
    final password = await storage.read(key: 'password');
    if (password == enteredPassword) {
      // Si le mot de passe est correct, naviguez vers l'écran de sécurité
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      // Sinon, affichez un message d'erreur et fermez le modal
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mot de passe incorrect. Veuillez réessayer.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 165, 171, 182),
              Color.fromARGB(0, 26, 68, 130),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ELIMU',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
