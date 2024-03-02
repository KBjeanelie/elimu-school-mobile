import 'package:elimu_school_mobile/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

class EbookScreen extends StatelessWidget {
  const EbookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
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
            text: 'E-Book',
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: TextField(
                  style: GoogleFonts.poppins(),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    hintText: 'Recherchez .....',
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                shrinkWrap: true, // Pour éviter l'erreur de débordement
                children: [
                  Container(
                    height: 80,
                    width: 40,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 145,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Text(
                          'initiation en algorithme',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Ajoutez d'autres éléments de la grille ici
                ],
              ),
            ],
          ),
        ),
      );
  }
}
