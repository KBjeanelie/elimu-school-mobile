import 'package:elimu_school_mobile/config/color_border_container.dart';
import 'package:elimu_school_mobile/config/size_config.dart';
import 'package:elimu_school_mobile/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/themes.dart';
import '../widgets/widgets.dart';

class EventAnnouce extends StatelessWidget {
  const EventAnnouce({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              IconlyLight.arrowLeft2,
              color: Colors.black,
            )),
        title: const CustomAppBar(
          text: 'Evenement et Annonce',
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: DefaultTabController(length: 2,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: 40,
              child: TabBar(
                indicatorColor: getColorFromHex("#04294B"),
                tabs: [
                  Tab(
                    child: customeTextStyle("Information", size: 14, fontWeight: FontWeight.w600),
                  ),
                  Tab(
                    child: customeTextStyle("Évenement", size: 14, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: List.generate(1, (index) {
                        return const AnnounceModel(titre: "Sortie scolaire",
                        description: "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum.",);
                      }),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(2, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                                  spreadRadius: 5, // Étendue de l'ombre
                                  blurRadius: 7, // Flou de l'ombre
                                  offset: const Offset(0, 3), // Décalage de l'ombre
                                ),
                              ]
                            ),
                            child: cardEvent(context)),
                        );
                      }),
                    ),
                  ),
                ],
              )
            )

          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // print('Inscription');
      //   },
      //   label: const Text('S\'inscrire'),
      //   backgroundColor: const Color.fromARGB(255, 0, 26, 65),
      //   // foregroundColor: bBlue,
      // ),
    );
  }
}

class AnnounceModel extends StatelessWidget {
  final String titre;
  final String description;
  const AnnounceModel({
    super.key,
    required this.titre,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 45,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: bViolet,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                titre,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: getProportionateScreenHeight(16),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: SizedBox(
                width: 300,
                child: Text(description, textAlign: TextAlign.center),
              ),
            ),
            const Divider(
              color: Colors.grey,
              indent: 30,
              endIndent: 30,
              height: 1,
              thickness: 1,
            ),
            TextButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: SizedBox(
                      width: 100,
                      child: Column(children: [
                        Stack(
                          children: [
                            Positioned(
                              child: Icon(
                                IconlyLight.volumeDown,
                                size: getProportionateScreenHeight(55),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 2,
                              child: Container(
                                height: 23,
                                width: 23,
                                decoration: BoxDecoration(
                                  color: bViolet,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            // TITRE de l'evenement ou de l'annonce
                          ],
                        ),
                        Text(
                          'Journée de l\'indépendance',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 30,
                          endIndent: 30,
                          height: 1,
                          thickness: 1,
                        ),
                      ]),
                    ),
                    content: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'School will remain close on,\n15th August, 2024',
                        style: GoogleFonts.poppins(
                          fontSize: getProportionateScreenHeight(14),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    actions: <Widget>[
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(150, 255, 214, 64),
                                spreadRadius: 1,
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, 'Inscrit');
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(200, 40),
                                backgroundColor: Colors.amber),
                            child: Text(
                              'Retour',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                'read more',
                style: GoogleFonts.poppins(
                    fontSize: getProportionateScreenHeight(13),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
