

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_app/app_route.dart';
import 'package:partner_app/schema/appcolor.dart';
import 'package:partner_app/schema/test_style.dart';

class Checkmailpassword_screen extends StatefulWidget {
  const Checkmailpassword_screen({Key? key}) : super(key: key);

  @override
  State<Checkmailpassword_screen> createState() => _Checkmailpassword_screenState();
}

class _Checkmailpassword_screenState extends State<Checkmailpassword_screen> {
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
          padding: const EdgeInsets.only(left: 24.0,right:24,top:60),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(height: 180),
                Text("CHECK YOUR EMAIL",style: TextStyle(fontFamily:'Oswald' ).normal25w600,),

                Padding(
                  padding: const EdgeInsets.only(left: 45.0,right: 45,top: 10),
                  child: Text("We have sent a password recovery instruction to your email",textAlign:TextAlign.center,style: TextStyle().normal16w600,),
                ),
           SizedBox(height: 230,),
               GestureDetector(
                onTap: (){
                  Get.toNamed(AppRouter.newPasswordScreen);
                },
                child: Container(
                  height: 50,
                  width: context.width,
                  child: Center(child: Text("CONTINUE",textAlign:TextAlign.center,style: TextStyle(fontFamily: 'inter',color: Colors.white).normal14w500,)),
                  decoration: BoxDecoration(
                    color:AppColor.buttoncolor,

                    borderRadius: BorderRadius.circular(30),

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
      ),
    );
  }
}