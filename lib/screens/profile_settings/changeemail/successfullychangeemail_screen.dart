import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/screens/home_screen.dart';

class SuccessfullyChangeEmailScreen extends StatefulWidget {
  const SuccessfullyChangeEmailScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfullyChangeEmailScreen> createState() =>
      _SuccessfullyChangeEmailScreenState();
}

class _SuccessfullyChangeEmailScreenState
    extends State<SuccessfullyChangeEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Email is Changed',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 135.0, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 200),
              Text(
                "Congratulate!",
                textAlign: TextAlign.center,
                style: const TextStyle().normal16w600,
              ),
              Text(
                "YOUR EMAIL IS CHANGED",
                style: const TextStyle(fontFamily: 'Oswald').normal25w600,
              ),
              const SizedBox(height: 240),
              GestureDetector(
                onTap: () {
                    Get.offAllNamed(AppRouter.homeScreen);

                },
                child: Container(
                  height: 50,
                  width: context.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.buttoncolor,
                      border: Border.all(color: Colors.green)),
                  child: Center(
                      child: Text(
                    "CONTINUE",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                            fontFamily: 'inter', color: Colors.white)
                        .normal14w500,
                  )),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
