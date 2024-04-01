import 'package:elimu_school_mobile/config/color_border_container.dart';
import 'package:elimu_school_mobile/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: getProportionateScreenHeight(53),
      width: getProportionateScreenWidth(250),
      child: Stack(
        children: [
          Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: getProportionateScreenHeight(20)),
            ),
          ),
          Positioned(
            right: getProportionateScreenWidth(43),
            bottom: getProportionateScreenWidth(15),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: cBlue,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            left: getProportionateScreenWidth(0),
            bottom: getProportionateScreenWidth(0),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: cJaune,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CustomAppBar2 extends StatelessWidget {
  final String text;
  const CustomAppBar2({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: getProportionateScreenHeight(53),
      width: getProportionateScreenWidth(250),
      child: Stack(
        children: [
          Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenHeight(17)),
            ),
          ),
          Positioned(
            right: getProportionateScreenWidth(30),
            bottom: getProportionateScreenWidth(15),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: cBlue,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            left: getProportionateScreenWidth(0),
            bottom: getProportionateScreenWidth(0),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: cJaune,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}