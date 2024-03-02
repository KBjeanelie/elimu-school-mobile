import 'package:elimu_school_mobile/config/color_border_container.dart';
import 'package:elimu_school_mobile/screens/devoir.dart';
import 'package:flutter/material.dart';
import 'package:elimu_school_mobile/widget/custom_appbar.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

class Presence extends StatelessWidget {
  const Presence({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              IconlyLight.arrowLeft2,
              color: Colors.black,
            ),
          ),
          title: const CustomAppBar(
            text: 'Présence',
          ),
          elevation: 0.5,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const NomFiltre(
                titre: 'Aujourd\'hui',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: bRouge,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date du jour',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        Text(
                          'ABSENT',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const NomFiltre(titre: 'Semestre'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PresenceL(
                      texte: 'P',
                      couleur: cBlue,
                      top: null,
                      left: 6,
                      right: null,
                      bottom: 6,
                    ),
                    PresenceL(
                      texte: 'A',
                      couleur: cJaune,
                      top: 3,
                      left: 10,
                      right: null,
                      bottom: null,
                    ),
                    PresenceL(
                      texte: 'Q',
                      couleur: cViolet,
                      top: null,
                      left: null,
                      right: 7,
                      bottom: 3,
                    ),
                  ],
                ),
              ),
              const NomFiltre(
                titre: '7 dernier jours',
              ),
              const Column(
                children: [
                  PresenceD(
                    jours: '14 Janviers 2024',
                    presence: 'Absent',
                    couleur: Colors.red,
                  ),
                  PresenceD(
                    jours: '13 Janviers 2024',
                    presence: 'Quitté',
                    couleur: Colors.orange,
                  ),
                  PresenceD(
                    jours: '12 Janviers 2024',
                    presence: 'Present',
                    couleur: Colors.green,
                  ),
                  PresenceD(
                    jours: '11 Janviers 2024',
                    presence: 'Present',
                    couleur: Colors.green,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PresenceD extends StatelessWidget {
  final String jours;
  final String presence;
  final Color couleur;
  const PresenceD({
    super.key,
    required this.jours,
    required this.presence,
    required this.couleur,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            jours,
            style: GoogleFonts.poppins(),
          ),
          Text(
            presence,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w800,
              color: couleur,
            ),
          ),
        ],
      ),
    );
  }
}

class PresenceL extends StatelessWidget {
  final String texte;
  final Color couleur;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  const PresenceL({
    super.key,
    required this.texte,
    required this.couleur,
    required this.top,
    required this.left,
    required this.right,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.black,
            width: 3,
            style: BorderStyle.solid,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                texte,
                style: GoogleFonts.poppins(
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Positioned(
                bottom: bottom,
                left: left,
                right: right,
                top: top,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: couleur,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ))
          ],
        ));
  }
}

class DashedBorderContainer extends StatelessWidget {
  final Widget child;

  const DashedBorderContainer({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Couleur de la bordure
          width: 2, // Épaisseur de la bordure
        ),
        borderRadius: BorderRadius.circular(50), // Rayon de la bordure
      ),
      child: child,
    );
  }
}
