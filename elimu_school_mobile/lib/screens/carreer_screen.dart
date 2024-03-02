import 'package:elimu_school_mobile/config/themes.dart';
import 'package:elimu_school_mobile/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../widgets/widgets.dart';

class CarreerScreen extends StatelessWidget {
  const CarreerScreen({super.key});

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
          text: 'Parcours',
        ),
        centerTitle: true,
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(3, (index) {
            return Center(child: cardCareer(context));
          }),
        ),
      ),
    );
  }
}