import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_app/app_route.dart';
import 'package:partner_app/modules/homescreen/mydrawer.dart';
import 'package:partner_app/schema/appcolor.dart';
import 'package:partner_app/schema/test_style.dart';
import 'package:partner_app/utils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: MyDrawer(),
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24, top: 60),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    ImageConstant.humburger,
                    width: 40,
                    height: 40,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Image.asset(
                      ImageConstant.notification,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 85,
              ),
              Text(
                "CHECK YOUR CUSTOMER",
                style: TextStyle(fontFamily: 'Oswald').normal25w600,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 70, right: 70),
                child: Text(
                  "Scan their QR code to chek information about them",
                  textAlign: TextAlign.center,
                  style: TextStyle().normal16w600,
                ),
              ),
              SizedBox(height: 20,),
              Image.asset(ImageConstant.qrcode,width:246 ,height: 246,),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRouter.qrCodeTab);
            },
            child: Container(
              height: 50,
              width: context.width,
              child: Center(
                  child: Text(
                    "SCAN QR CODE",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'inter', color: Colors.white)
                        .normal14w500,
                  )),
              decoration: BoxDecoration(
                color: AppColor.buttoncolor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.green)),
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
