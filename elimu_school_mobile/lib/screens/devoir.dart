import 'package:elimu_school_mobile/config/size_config.dart';
import 'package:elimu_school_mobile/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

class DevoirScreen extends StatelessWidget {
  const DevoirScreen({super.key});

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
            text: 'Devoir Maison',
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              ////////////////////Separateur
              const NomFiltre(
                titre: 'Current weeks',
              ),
              ////////////////Information du devoir
              const ContainerMatiere(
                nomMatiere: 'SQL Server',
                description: 'CRUD command',
                dateLimit: '25 Fevrier 2024',
                corrige: true,
              ),
              ////////////////////Separateur
              const NomFiltre(titre: 'Previous weeks'),
              const ContainerMatiere(
                  nomMatiere: 'Algorithme',
                  description: 'Creation dun programme d\'addition',
                  dateLimit: '30 Decembre 2022',
                  corrige: false)
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerMatiere extends StatelessWidget {
  final String nomMatiere;
  final String description;
  final String dateLimit;
  final bool corrige;
  const ContainerMatiere({
    super.key,
    required this.nomMatiere,
    required this.description,
    required this.dateLimit,
    required this.corrige,
  });

  @override
  Widget build(BuildContext context) {
    bool yes = corrige;
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenHeight(20)),
      child: Container(
        height: 130,
        width: getProportionateScreenWidth(350),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //bande de couleur de gauche
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                height: getProportionateScreenHeight(100),
                width: 5,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nomMatiere,
                  style: GoogleFonts.poppins(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: getProportionateScreenHeight(12),
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800,
                  ),
                ),

                ///
                const SizedBox(
                  height: 4,
                ),

                ///
                Container(
                  width: getProportionateScreenWidth(250),
                  height: getProportionateScreenHeight(1),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100)),
                ),
                SizedBox(
                  height: 50,
                  width: 270,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Corriger
                      yes ? const Etat() : const SizedBox(),
                      //delai limite
                      const DelaiLimite(
                        date: '30 August, 2023',
                        icon: IconlyLight.timeCircle,
                        couleur: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //bande de couleur de droite
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                height: getProportionateScreenHeight(100),
                width: 5,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NomFiltre extends StatelessWidget {
  final String titre;

  const NomFiltre({
    super.key,
    required this.titre,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          titre,
          style: GoogleFonts.poppins(
            fontSize: getProportionateScreenHeight(14),
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          width: getProportionateScreenWidth(250),
          height: getProportionateScreenHeight(1),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(100)),
        ),
      ],
    );
  }
}

class Etat extends StatelessWidget {
  const Etat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          size: getProportionateScreenHeight(19),
        ),
        Text(
          'Corrigé',
          style: GoogleFonts.poppins(
              fontSize: getProportionateScreenHeight(12),
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class DelaiLimite extends StatelessWidget {
  final String date;
  final IconData icon;
  final Color couleur;
  const DelaiLimite({
    super.key,
    required this.date,
    required this.icon,
    required this.couleur,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: couleur,
          size: getProportionateScreenHeight(19),
        ),
        Text(
          date,
          style: GoogleFonts.poppins(
              fontSize: getProportionateScreenHeight(12),
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
