import 'dart:math';

import 'package:elimu_school_mobile/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/models_carousel.dart';

class ChildSelect extends StatefulWidget {
  ChildSelect({super.key});

  @override
  State<ChildSelect> createState() => _ChildSelectState();
}

class _ChildSelectState extends State<ChildSelect> {
  late PageController _pageController;
  final int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.8,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 60,
              ),
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 0.85,
                    child: PageView.builder(
                      itemCount: dataList.length,
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return carouselView(index);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 50,
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("\${data.nom}"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(dataList[index]),
        );
      },
    );
  }

  Widget carouselCard(DataModel data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage(
                          data.imageName,
                        ),
                        fit: BoxFit.fill),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black26,
                      ),
                    ]),
              ),
              onTap: () {
                debugPrint('\$${data.nom}');
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "\$${data.nom}",
          style: GoogleFonts.poppins(
            color: Colors.black38,
            fontSize: getProportionateScreenHeight(22),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "\$${data.prenom}",
          style: GoogleFonts.poppins(
            color: Colors.black38,
            fontSize: getProportionateScreenHeight(22),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
