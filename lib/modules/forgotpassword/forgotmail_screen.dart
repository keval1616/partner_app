

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_app/app_route.dart';
import 'package:partner_app/schema/test_style.dart';

class ForgotMailScreen extends StatefulWidget {
  const ForgotMailScreen({Key? key}) : super(key: key);

  @override
  State<ForgotMailScreen> createState() => _ForgotMailScreenState();
}

class _ForgotMailScreenState extends State<ForgotMailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0,right:24,top: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("CHECK YOUR EMAIL",style: TextStyle(fontFamily:'Oswald' ).normal25w600,),

              Padding(
                padding: const EdgeInsets.only(left: 45.0,right: 45,top: 10),
                child: Text("We have sent a password recovery instruction to your email",textAlign:TextAlign.center,style: TextStyle().normal16w600,),
              ),
             Spacer(),
             GestureDetector(
              onTap: (){
                Get.toNamed(AppRouter.newPasswordScreen);
              },
              child: Container(
                height: 50,
                width: context.width,
                child: Center(child: Text("CONTINUE",textAlign:TextAlign.center,style: TextStyle(fontFamily: 'inter',color: Colors.white).normal14w500,)),
                decoration: BoxDecoration(
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
      ),
    );
  }
}