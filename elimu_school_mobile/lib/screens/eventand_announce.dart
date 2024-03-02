import 'package:elimu_school_mobile/config/color_border_container.dart';
import 'package:elimu_school_mobile/config/size_config.dart';
import 'package:elimu_school_mobile/screens/devoir.dart';
import 'package:elimu_school_mobile/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

class EventAnnouce extends StatelessWidget {
  const EventAnnouce({super.key});

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
              )),
          title: const CustomAppBar(
            text: 'Evenement et Annonce',
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            const AnnounceModel(
              titre: 'Journée de L\'independance',
              description:
                  'dkfhbkvhbekhrbke cehkrbckc ekbrvev kre veirbv ceorvb eriv efivj erijv eriu vier fv ie e fu ef uheu veu d v eri vie i vi ei vie i vie r vre ver ve rv e  r ehir hi hifd ',
            ),
            Padding(
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
                        color: bRouge,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Sortie Sportif',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(14),
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          'description',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DelaiLimite(
                              date: '20 August, 2024',
                              icon: IconlyLight.timeCircle,
                              couleur: Colors.green),
                          DelaiLimite(
                              date: '28 August, 2024',
                              icon: IconlyLight.timeCircle,
                              couleur: Colors.red)
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      indent: 50,
                      endIndent: 50,
                      height: 1,
                      thickness: 1,
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: SizedBox(
                              height: 100,
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    // TITRE de l'evenement ou de l'annonce
                                  ],
                                ),
                                Text(
                                  'Sortie Sportif',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
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
                                'Ici se trouvera la description de l\'evenement',
                                style: GoogleFonts.poppins(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Retour',
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Inscrit');
                                },
                                child: Text(
                                  'S\'inscrire',
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                            ],
                          ),
                        ).then(
                          (value) {
                            if (value != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Inscription reussi',
                                  ),
                                  action: SnackBarAction(
                                    label: 'Ok',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                            }
                          },
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
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // print('Inscription');
          },
          label: const Text('S\'inscrire'),
          backgroundColor: const Color.fromARGB(255, 0, 26, 65),
          // foregroundColor: bBlue,
        ),
      ),
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
