import 'package:flutter/material.dart';

class ChildSelect extends StatelessWidget {
  const ChildSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
