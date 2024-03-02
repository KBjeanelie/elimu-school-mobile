import 'package:elimu_school_mobile/config/size_config.dart';
import 'package:elimu_school_mobile/config/themes.dart';
import 'package:elimu_school_mobile/screens/messageview_screen.dart';
import 'package:elimu_school_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          title: Center(
            child: Text(
              "Chats",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: black,
                fontSize: getProportionateScreenHeight(18)
              ),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MessageViews())
            );
          },
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: List.generate(
                4,
                (index) => const EleveCard2(
                  name: "Will Kenny",
                  photoProfil: "assets/user_profile.jpeg",
                  descrip:
                      "I can't help but be filled with anticipation and gratitude at the thought of sharing this adventure with such special people. Together we will create memories that will transcend time",
                ),
              ),
            ),
          ),
        ),
    );
  }
}