
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/controllers/splashcontroller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreenController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:    Center(
          child: Image.asset(
            'assets/images/appIcon.png',
            width: 200,
            height: 80,
          )),
    );
  }
}
