import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/screens/mydrawer.dart';
import 'package:gymui/screens/qr_scanner_page.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/utils.dart';
import 'package:gymui/widgets/height_spacer.dart';

class QrCodeTab extends StatefulWidget {
  const QrCodeTab({super.key});

  @override
  State<QrCodeTab> createState() => _QrCodeTabState();
}

class _QrCodeTabState extends State<QrCodeTab> {
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
                  Builder(
                      builder: (context) => GestureDetector(
                            onTap: () => Scaffold.of(context).openDrawer(),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]),
                                child: const Icon(
                                  Icons.menu,
                                  color: AppColor.buttoncolor,
                                ),
                              ),
                            ),
                          )),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRouter.notificationScreen);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ]),
                      child: const Icon(Icons.notifications,
                          color: AppColor.buttoncolor),
                    ),
                  ),
                ],
              ),
              const HeightSpacer(height: 85),
              Text(
                "CHECK YOUR CUSTOMER",
                style: const TextStyle(fontFamily: 'Oswald').normal25w600,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 70, right: 70),
                child: Text(
                  "Scan their QR code to chek information about them",
                  textAlign: TextAlign.center,
                  style: const TextStyle().normal16w600,
                ),
              ),
              const HeightSpacer(height: 30.0),
              Image.asset(
                'assets/images/scanner.jpeg',
                width: 220,
                height: 220,
              ),
              const HeightSpacer(height: 30.0),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRouter.qrSacnnerPage);
                },
                child: Container(
                  height: 50,
                  //width: context.width,
                  decoration: BoxDecoration(
                      color: Utlis.green,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.green)),
                  child: Center(
                      child: Text(
                    "SCAN QR CODE",
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
