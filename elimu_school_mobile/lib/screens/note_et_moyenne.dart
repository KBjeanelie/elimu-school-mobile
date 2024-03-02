import 'package:elimu_school_mobile/config/color_border_container.dart';
import 'package:elimu_school_mobile/config/size_config.dart';
import 'package:elimu_school_mobile/config/themes.dart';
import 'package:elimu_school_mobile/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class MoyenneScreen extends StatelessWidget {
  const MoyenneScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //bool _isAdmit = false;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 1,
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
            text: 'Note(s) et Moyenne(s)',
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: DefaultTabController(length: 3,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                height: 40,
                child: TabBar(
                  //indicatorColor: getColorFromHex("#04294B"),
                  tabs: [
                    Tab(
                      child: customeTextStyle("Contrôle", size: 14, fontWeight: FontWeight.w600),
                    ),
                    Tab(
                      child: customeTextStyle("Partiel", size: 14, fontWeight: FontWeight.w600),
                    ),
                    Tab(
                      child: customeTextStyle("Moyenne", size: 14, fontWeight: FontWeight.w600),
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
                        children: List.generate(3, (index) {
                          return evaluation_card();
                        }),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: List.generate(7, (index) {
                          return evaluation_card();
                        }),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: List.generate(10, (index) {
                          return average_card();
                        }),
                      ),
                    ),
                  ],
                )
              )

            ],
          ),
        )
      );
  }
}

Column average_card() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Container(
          height: getProportionateScreenHeight(200),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //bord container
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                child: Container(
                  height: double.infinity,
                  width: 5,
                  decoration: BoxDecoration(
                    color: cBlue,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  // color: Colors.green,
                  width: 270,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customeTextStyle("Parcours : ", size: 15, color: black, fontWeight: FontWeight.bold),
                            Expanded(child: customeTextStyle('Licence Informatique 1', size: 14))
                        ],),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            customeTextStyle("Semestre : ", size: 15, color: black, fontWeight: FontWeight.bold),
                            customeTextStyle('1', size: 14)
                        ],),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            customeTextStyle("Niveau : ", size: 15, color: black, fontWeight: FontWeight.bold),
                            customeTextStyle('1ere année', size: 14)
                        ],),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customeTextStyle("Moyenne : ", size: 15, color: black, fontWeight: FontWeight.bold),
                            Expanded(child: customeTextStyle('12,25', size: 14))
                        ],),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customeTextStyle("Décision : ", size: 15, color: black, fontWeight: FontWeight.bold),
                            btn_valided(true)
                        ],),
                      )
                    ],
                  ),
                ),
              ),
              
              //bord container
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Container(
                  height: double.infinity,
                  width: 5,
                  decoration: BoxDecoration(
                    color: cBlue,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Column evaluation_card() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Container(
          height: getProportionateScreenHeight(160),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //bord container
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                child: Container(
                  height: double.infinity,
                  width: 5,
                  decoration: BoxDecoration(
                    color: cBlue,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  // color: Colors.green,
                  width: 270,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customeTextStyle("Matière : ", size: 15, color: black, fontWeight: FontWeight.bold),
                            Expanded(child: customeTextStyle('Algorithme', size: 14))
                        ],),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            customeTextStyle("Note : ", size: 15, color: black, fontWeight: FontWeight.bold),
                            customeTextStyle('16', size: 14)
                        ],),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            customeTextStyle("Coefficient : ", size: 15, color: black, fontWeight: FontWeight.bold),
                            customeTextStyle('5', size: 14)
                        ],),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customeTextStyle("Enseignant : ", size: 15, color: black, fontWeight: FontWeight.bold),
                            Expanded(child: customeTextStyle('OYERE Morel', size: 14))
                        ],),
                      )
                    ],
                  ),
                ),
              ),
              
              //bord container
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Container(
                  height: double.infinity,
                  width: 5,
                  decoration: BoxDecoration(
                    color: cBlue,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Container btn_valided(isAdmi) {
  return Container(
    height: 30,
    width: 80,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isAdmi ? Colors.green : Colors.red,
      borderRadius: BorderRadius.circular(20),
    ),
    child: customeTextStyle(isAdmi ? 'Admis' : "Recalé",)
  );
}
