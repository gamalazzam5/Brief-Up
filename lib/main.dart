import 'package:brief_up/screens/splash_screen.dart';

import 'package:flutter/material.dart';




void main() {
  runApp(BriefUp());
}

class BriefUp extends StatelessWidget {
  const BriefUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

