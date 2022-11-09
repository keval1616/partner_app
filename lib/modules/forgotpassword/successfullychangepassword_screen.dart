

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_app/app_route.dart';
import 'package:partner_app/schema/test_style.dart';
import 'package:partner_app/utils/images.dart';

class SuccessChangePasswordScreen extends StatefulWidget {
  const SuccessChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<SuccessChangePasswordScreen> createState() => _SuccessChangePasswordScreenState();
}

class _SuccessChangePasswordScreenState extends State<SuccessChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 214.0,left: 24,right: 24),
        child: Column(
          children: [
            Center(child: Image.asset(ImageConstant.appicon,width: 158,height: 40,)),
            Spacer(),
            Text(
              "Congratulate!",
              textAlign: TextAlign.center,
              style: TextStyle().normal16w600,

            ),
            Text(
              "YOUR PASSWORD IS CHANGED",
              style: TextStyle(fontFamily: 'Oswald').normal25w600,
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRouter.loginscreen);
              },
              child: Container(
                height: 50,
                width: context.width,
                child: Center(child: Text("CONTINUE",textAlign:TextAlign.center,style: TextStyle(fontFamily: 'inter',color: Colors.white).normal14w500,)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green,
                    border: Border.all(color: Colors.green)
                ),
              ),
            ),

            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}