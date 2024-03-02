import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const white = Colors.white;
const black = Colors.black;

const top= EdgeInsets.only(top: 15);

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll('#', ''); // Supprime le symbole '#'
  return Color(int.parse('FF$hexColor', radix: 16)); // Ajoute l'opacité 'FF' avant le code hexadécimal
}


Divider lineBar = const Divider(height: 0.5, color: black, thickness: 0.5,);

Icon customeIcon(IconData iconData, {color = black, double iconSize = 25}) {
  return Icon(
    iconData,
    size: iconSize,
    color: color,
  );
}


// Font app
Text customeTextStyle(String text,
  {FontWeight fontWeight = FontWeight.normal,
  double size = 13,
  double letterSpace = 0.5,
  Color color = black,
  TextAlign align = TextAlign.start}) {
  return Text(
    text,
    textAlign: align,
    style: GoogleFonts.comfortaa(
      color: color,
      letterSpacing: letterSpace,
      fontSize: size,
      fontWeight: fontWeight
    )
  );
}

Text customeTextStyleMessage(String text,
  {FontWeight fontWeight = FontWeight.normal,
  double size = 15,
  double letterSpace = 0.5,
  Color color = black,
  TextAlign align = TextAlign.start}) {
  return Text(
    text,
    textAlign: align,
    style: GoogleFonts.openSans(
      color: color,
      letterSpacing: letterSpace,
      fontSize: size,
      fontWeight: fontWeight
    )
  );
}

