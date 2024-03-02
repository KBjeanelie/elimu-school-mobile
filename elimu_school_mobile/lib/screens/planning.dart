import 'package:elimu_school_mobile/config/themes.dart';
import 'package:flutter/material.dart';
import 'package:elimu_school_mobile/config/size_config.dart';
import 'package:elimu_school_mobile/config/color_border_container.dart';
import 'package:elimu_school_mobile/widget/custom_appbar.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

List<String> weekDays = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'];

List<List<String>> coursListByDay = [
  [
    'Algorithme',
    'Anglais',
    'Mathematique',
    'Poo',
    'JAVA',
    'PYTHON',
    'Francais',
    'Finances'
  ],
  ['Anglais', 'Mathematique', 'Poo', 'Francais', 'Finances'],
  ['Mathematique', 'JAVA', 'PYTHON', 'Finances'],
  ['Poo', 'Francais', 'Finances'],
  ['Algorithme', 'JAVA', 'PYTHON'],
  [], // Vide pour le samedi
  [] // Vide pour le dimanche
];

class EmploiDuTemps extends StatefulWidget {
  const EmploiDuTemps({super.key});

  @override
  State<EmploiDuTemps> createState() => _EmploiDuTempsState();
}

class _EmploiDuTempsState extends State<EmploiDuTemps> {
  late String selectedDay;

  @override
  void initState() {
    super.initState();
    selectedDay = getCurrentDay();
  }

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
            ),
          ),
          title: const CustomAppBar(
            text: 'Devoir Maison',
          ),
          elevation: 0.5,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var day in weekDays)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = day;
                          });
                        },
                        child: DayS(
                          jour: day,
                          isDay: day == selectedDay,
                          isRed: day == 'Sam',
                        ),
                      ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade800,
                indent: 40,
                endIndent: 40,
                height: 1,
                thickness: 1,
              ),
              const SizedBox(
                height: 5,
              ),
              CoursTimeList(selectedDay),
            ],
          ),
        ),
      );
  }
}

class CoursTimeList extends StatelessWidget {
  final String selectedDay;

  const CoursTimeList(this.selectedDay, {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> coursForSelectedDay = getCoursForSelectedDay(selectedDay);

    return Column(
      children: [
        for (var i = 0; i < coursForSelectedDay.length; i++)
          CoursTime(
            heure: '${8 + i}:00',
            cours: coursForSelectedDay[i],
            bkColors: bkJaune,
          ),
        //heure de pause
        const PauseTime(),
        //
        for (var i = coursForSelectedDay.length; i < 9; i++)
          CoursTime(
            heure: '${12 + (i - coursForSelectedDay.length)}:00',
            cours: 'PAUSE',
            bkColors: Colors.grey.shade100,
          ),
      ],
    );
  }
}

class PauseTime extends StatelessWidget {
  const PauseTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customeTextStyle("12:00"),
          Container(
            height: getProportionateScreenHeight(35),
            width: getProportionateScreenWidth(250),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            ),
            child: customeTextStyle('PAUSE')
          ),
        ],
      ),
    );
  }
}

class CoursTime extends StatelessWidget {
  final String heure;
  final String cours;
  final Color bkColors;
  const CoursTime({super.key, 
    required this.heure,
    required this.cours,
    required this.bkColors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customeTextStyle(heure),
          Container(
            height: 35,
            width: 250,
            margin: const EdgeInsets.only(left: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bkColors,
              borderRadius: BorderRadius.circular(5),
            ),
            child: customeTextStyle(cours)
          ),
        ],
      ),
    );
  }
}

class DayS extends StatelessWidget {
  final bool isDay;
  final bool isRed;
  final String jour;

  const DayS({
    super.key,
    required this.jour,
    required this.isDay,
    required this.isRed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 47,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isDay ? const Color.fromARGB(171, 255, 153, 0) : null,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          isDay
              ? const BoxShadow(
                  color: Color.fromARGB(171, 255, 153, 0),
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              : const BoxShadow(color: Colors.white),
        ],
      ),
      child: Text(
        jour,
        style: TextStyle(
          color: isDay ? Colors.white : (isRed ? Colors.red : Colors.black),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

String getCurrentDay() {
  DateTime now = DateTime.now();
  int currentWeekday = now.weekday;

  switch (currentWeekday) {
    case 1:
      return 'Lun';
    case 2:
      return 'Mar';
    case 3:
      return 'Mer';
    case 4:
      return 'Jeu';
    case 5:
      return 'Ven';
    case 6:
      return 'Sam';
    default:
      return 'Lun';
  }
}

List<String> getCoursForSelectedDay(String selectedDay) {
  int index = weekDays.indexOf(selectedDay);
  return coursListByDay[index];
}
