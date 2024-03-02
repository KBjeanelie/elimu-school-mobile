import 'package:elimu_school_mobile/config/themes.dart';
import 'package:elimu_school_mobile/widget/custom_appbar.dart';
import 'package:elimu_school_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColorFromHex("#E2E2E2"),
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
          text: 'Finance',
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
                indicatorColor: getColorFromHex("#04294B"),
                tabs: [
                  Tab(
                    child: customeTextStyle("Réglé", size: 14, fontWeight: FontWeight.w600),
                  ),
                  Tab(
                    child: customeTextStyle("Non-Réglé", size: 14, fontWeight: FontWeight.w600),
                  ),
                  Tab(
                    child: customeTextStyle("Total annuel", size: 14, fontWeight: FontWeight.w600),
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
                        return cardFinance(context);
                      }),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(1, (index) {
                        return customeTextStyle("text1");
                      }),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(1, (index) {
                        return customeTextStyle("text");
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