import 'package:elimu_school_mobile/config/themes.dart';
import 'package:elimu_school_mobile/screens/account_screen.dart';
import 'package:elimu_school_mobile/screens/contact_screen.dart';
import 'package:elimu_school_mobile/screens/dashboard_screen.dart';
import 'package:elimu_school_mobile/screens/messages_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  
  static const List<Widget> _widgetOptions =  <Widget>[
    DashBoardScreen(),
    MessagesScreen(),
    ContactScreen(),
    AccountScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        currentIndex: _currentIndex,
        elevation: 1,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 13,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: customeIcon(IconlyLight.home),
            activeIcon: customeIcon(IconlyBold.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: customeIcon(IconlyLight.message),
            activeIcon: customeIcon(IconlyBold.message),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: customeIcon(IconlyLight.calling),
            activeIcon: customeIcon(IconlyBold.calling),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: customeIcon(IconlyLight.profile),
            activeIcon: customeIcon(IconlyBold.profile),
            label: '',
          ),
        ],
      ),
    );
  }
}