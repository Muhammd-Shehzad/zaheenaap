import 'package:flutter/material.dart';
import 'package:zaheenaap/Ui/Home/home_screen.dart';

class SplashService {
  void isLogIn(context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }
}
