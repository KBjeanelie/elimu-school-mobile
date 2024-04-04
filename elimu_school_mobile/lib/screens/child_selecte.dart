import 'dart:math';
import 'package:elimu_school_mobile/config/size_config.dart';
import 'package:elimu_school_mobile/screens/dashboard_screen.dart';
import 'package:elimu_school_mobile/screens/eventand_announce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/themes.dart';
import '../models/models_carousel.dart';
import 'account_screen.dart';

class ChildSelect extends StatefulWidget {
  const ChildSelect({super.key});

  @override
  State<ChildSelect> createState() => _ChildSelectState();
}

class _ChildSelectState extends State<ChildSelect> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
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
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: white,
        title: customeTextStyle("Bonjour, Ruth", size: 14),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EventAnnouce())
              );
            },
            icon: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: customeIcon(IconlyLight.calendar),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AccountScreen())
              );
            },
            icon: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: customeIcon(IconlyLight.profile),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
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
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () {
                    final selectedChild =
                        dataList[_pageController.page!.round()];
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Confirmation"),
                        content: Text(
                            "Vous avez sélectionné ${selectedChild.nom}"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Annuler"),
                          ),
                          TextButton(
                            onPressed: () {
                              // Traitez l'action de sélection de l'enfant ici
                              Navigator.pop(context);
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => DashBoardScreen(selectedChild.nom))
                              );
                            },
                            child: const Text("Confirmer"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text("Sélectionner"),
                ),
              ],
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
                    image: AssetImage(data.imageName),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              onTap: () {
                debugPrint(data.nom);
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          data.nom,
          style: GoogleFonts.poppins(
            color: Colors.black38,
            fontSize: getProportionateScreenHeight(22),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          data.prenom,
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
