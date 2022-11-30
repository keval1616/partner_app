import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/auth_screens/forgotpassword/newpassword_screen.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/widgets/height_spacer.dart';

class CheckMailAddress extends StatefulWidget {
  const CheckMailAddress({Key? key}) : super(key: key);

  @override
  State<CheckMailAddress> createState() => _CheckMailAddressState();
}

class _CheckMailAddressState extends State<CheckMailAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Check Your Email',
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
                const HeightSpacer(height: 180.0),
                Text(
                  "CHECK YOUR EMAIL",
                  style: const TextStyle(fontFamily: 'Oswald').normal25w600,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 45.0, right: 45, top: 10),
                  child: Text(
                    "We have sent a password recovery instruction to your email",
                    textAlign: TextAlign.center,
                    style: const TextStyle().normal16w600,
                  ),
                ),
                const HeightSpacer(height: 230.0),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouter.newPasswordScreen);
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
    );
  }
}
