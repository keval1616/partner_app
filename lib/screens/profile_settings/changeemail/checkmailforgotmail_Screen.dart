import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/screens/profile_settings/changeemail/successfullychangeemail_screen.dart';

class CheckMailForgotScreen extends StatefulWidget {
  const CheckMailForgotScreen({Key? key}) : super(key: key);

  @override
  State<CheckMailForgotScreen> createState() => _CheckMailForgotScreenState();
}

class _CheckMailForgotScreenState extends State<CheckMailForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusManager.instance.primaryFocus!.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Vereficate Email',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20.0,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24, top: 60),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    "VEREFICATION YOUR NEW EMAIL",
                    style: const TextStyle(fontFamily: 'Oswald').normal25w600,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 45.0, right: 45, top: 10),
                    child: Text(
                      "We have sent a verefication link to your new email address",
                      textAlign: TextAlign.center,
                      style: const TextStyle().normal16w600,
                    ),
                  ),
                  const SizedBox(
                    height: 310,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRouter.successfullyChangeEmailScreen);
                    },
                    child: Container(
                      height: 50,
                      width: context.width,
                      decoration: BoxDecoration(
                        color: AppColor.buttoncolor,
                        borderRadius: BorderRadius.circular(30),
                      ),
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
        ),
      ),
    );
  }
}
