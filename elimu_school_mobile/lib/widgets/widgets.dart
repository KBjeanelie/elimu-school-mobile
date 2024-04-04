// C'est dans ce fichier que sera créer tous les widgets nécéssaire à notre application
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/color_border_container.dart';
import '../config/size_config.dart';
import '../config/themes.dart';
import '../screens/devoir.dart';


Container messageGroupModel(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 100),
          child: CircleAvatar(backgroundColor: Colors.grey.shade500,)
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 2),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: getColorFromHex("#FAFF00"),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                customeTextStyleMessage("Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée.",
                size: 12),
                Container(
                  child: customeTextStyleMessage("12:41", size: 9),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}


Container messageGroupUser(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
    child: Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 2),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                customeTextStyleMessage("Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée.",
                size: 13
                ),
                Container(
                  child: customeTextStyleMessage("12:41", size: 9),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 130),
          child: CircleAvatar(backgroundColor: Colors.grey.shade500,)
        ),
      ],
    ),
  );
}


Container cardFinance(BuildContext context){
  return Container(
    margin: top,
    padding: const EdgeInsets.all(25),
    width: MediaQuery.sizeOf(context).width * 0.9,
    height: MediaQuery.sizeOf(context).height * 0.2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.grey.shade100
    ),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customeTextStyle("Frais Mensuel", size: 15, fontWeight: FontWeight.bold),
          customeTextStyle("Octobre", size: 15, fontWeight: FontWeight.bold),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customeTextStyle("Remis"),
            customeTextStyle("30 000F CFA"),
          ],
        ),
      ),

      Container(
        margin: const EdgeInsets.only(top: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customeTextStyle("Reste"),
            customeTextStyle("0F CFA"),
          ],
        ),
      ),

      Container(
        margin: top,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customeTextStyle("Total", size: 15, fontWeight: FontWeight.bold),
            customeTextStyle("30 000F CFA", size: 15, fontWeight: FontWeight.bold),
          ],
        ),
      )
    ]),
  );
}

Container cardMenue(BuildContext context, IconData icon, String label, {Color color = black}){
  return Container(
    width: MediaQuery.sizeOf(context).width * 0.4,
    height: MediaQuery.sizeOf(context).height * 0.17,
    alignment: Alignment.center,
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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: top,
          child: customeIcon(icon, color: color, iconSize: 70,)),
        Container(
          margin: top,
          alignment: Alignment.center,
          child: customeTextStyle(label, size: 13))
      ],
    ),
  );
}

Container cardCareer(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(top: 30),
    width: MediaQuery.sizeOf(context).width * 0.7,
    height: MediaQuery.sizeOf(context).height * 0.4,
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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: top,
          alignment: Alignment.center,
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: getColorFromHex("#A066FF"),
            borderRadius: BorderRadius.circular(50)
          ),
          child: customeIcon(EvaIcons.homeOutline, iconSize: 30, color: getColorFromHex("#794DC0")),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: customeTextStyle("Parcours :", size: 15, fontWeight: FontWeight.w600),
        ),
        Container(
          child: customeTextStyle("Lic Info 1", fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 5),
          child: lineBar,
        ),
        Container(
          child: customeTextStyle("Niveau :", size: 15, fontWeight: FontWeight.w600),
        ),
        Container(
          child: customeTextStyle("Première année", fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 5),
          child: lineBar,
        ),
        Container(
          child: customeTextStyle("Moyenne :", size: 15, fontWeight: FontWeight.w600),
        ),
        Container(
          child: customeTextStyle("12,50", fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 5),
          child: lineBar,
        ),
        Container(
          child: customeTextStyle("Année académique :", size: 15, fontWeight: FontWeight.w600),
        ),
        Container(
          child: customeTextStyle("2022 - 2023", fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}


class EleveCard extends StatefulWidget {
  final String name;
  final String photoProfil;
  final String country;
  const EleveCard({
    Key? key,
    required this.name,
    required this.photoProfil,
    required this.country,
  }) : super(key: key);

  @override
  State<EleveCard> createState() => _EleveCardState();
}

class _EleveCardState extends State<EleveCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          ClipOval(
            child: Image.asset(
              widget.photoProfil,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.name, // Utilisez widget.nomPrenom ici
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            widget.country, // Utilisez widget.nomPrenom ici
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


class EleveCard2 extends StatefulWidget {
  final String name;
  final String photoProfil;
  final String descrip;
  const EleveCard2({
    Key? key,
    required this.name,
    required this.photoProfil,
    required this.descrip,
  }) : super(key: key);

  @override
  State<EleveCard2> createState() => _EleveCard2State();
}

class _EleveCard2State extends State<EleveCard2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      margin: const EdgeInsets.only(top: 2),
      child: ListTile(
        leading: ClipOval(
            child: Image.asset(
              widget.photoProfil,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        title: customeTextStyle(widget.name, size: 13, fontWeight: FontWeight.w600),
        subtitle: customeTextStyleMessage('${widget.descrip.substring(0, 50)}...', size: 12, fontWeight: FontWeight.w300),
      ),
    );
  }
}


class EleveCard3 extends StatefulWidget {
  final String name;
  final String photoProfil;
  const EleveCard3({
    Key? key,
    required this.name,
    required this.photoProfil,
  }) : super(key: key);

  @override
  State<EleveCard3> createState() => _EleveCard3State();
}

class _EleveCard3State extends State<EleveCard3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      margin: const EdgeInsets.only(top: 2),
      child: ListTile(
        leading: ClipOval(
            child: Image.asset(
              widget.photoProfil,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        title: customeTextStyle(widget.name, size: 13, fontWeight: FontWeight.w600),
        
      ),
    );
  }
}

Column cardEvent(BuildContext context){
  return Column(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
  );
}
