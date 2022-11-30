import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/screens/home_screen.dart';
import 'package:gymui/widgets/height_spacer.dart';

class SuccessChangePasswordScreen extends StatefulWidget {
  const SuccessChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<SuccessChangePasswordScreen> createState() =>
      _SuccessChangePasswordScreenState();
}

class _SuccessChangePasswordScreenState
    extends State<SuccessChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 214.0, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Image.asset(
                'assets/images/appIcon.png',
                width: 158,
                height: 40,
              )),
              const HeightSpacer(height: 200.0),
              Text(
                "Congratulate!",
                textAlign: TextAlign.center,
                style: const TextStyle().normal16w600,
              ),
              Text(
                "YOUR PASSWORD IS CHANGED",
                style: const TextStyle(fontFamily: 'Oswald').normal25w600,
              ),
              const SizedBox(height: 240),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRouter.homeScreen);
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
