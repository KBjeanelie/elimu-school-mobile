import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../config/size_config.dart';
import '../config/themes.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  // Enregistrement du mot de passe
void savePassword(String password) async {
  final storage = FlutterSecureStorage();
  await storage.write(key: 'password', value: password);
}
  bool isActive = false;
  final TextEditingController _passwordController =
      TextEditingController(); // Déclaration du TextEditingController
  bool _validatePassword = false; // Ajout de la variable _validatePassword

  @override
  void dispose() {
    _passwordController
        .dispose(); // N'oubliez pas de libérer le TextEditingController lorsqu'il n'est plus nécessaire
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: white,
          title: Text(
            "Securité",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: black,
                fontSize: getProportionateScreenHeight(20)),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(25),
            vertical: getProportionateScreenHeight(20),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Text(
                    'Use password',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Switch(
                    activeColor: Colors.orange,
                    value: isActive,
                    onChanged: (value) {
                      setState(() {
                        isActive = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Lorsque cette option sera activée, vous devrez utiliser le mot de passe pour deverouiller ELIMU. Vous recevrez toujours les notifications.',
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              isActive
                  ? AnimatedOpacity(
                      opacity: isActive ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 400),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Enter your password',
                          errorText: _validatePassword
                              ? (_passwordController.text.isEmpty
                                  ? 'Please enter your password'
                                  : 'Password must be at least 4 characters')
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        controller: _passwordController,
                        onChanged: (value) {
                          setState(() {
                            _validatePassword = false;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              _validatePassword = true;
                            });
                            return 'Please enter your password';
                          }
                          if (value.length < 4) {
                            setState(() {
                              _validatePassword = true;
                            });
                            return 'Password must be at least 4 characters';
                          }
                          return null;
                        },
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              isActive
                  ? ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: Text(
                        'Sauvegarder',
                        style: GoogleFonts.poppins(),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
