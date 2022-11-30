// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/controllers/mydrawer_controller.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/screens/contact_us.dart';
import 'package:gymui/screens/drawer_controller.dart';
import 'package:gymui/screens/home_screen.dart';
import 'package:gymui/screens/privacy_policy.dart';
import 'package:gymui/screens/profile_settings/profile_change_screen.dart';
import 'package:gymui/screens/terms_of_use.dart';
import 'package:gymui/services/auth_service.dart';
import 'package:gymui/utils.dart';
import 'package:gymui/utils/app_preferences.dart';
import 'package:gymui/widgets/height_spacer.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({
    Key? key,
  }) : super(key: key);
  final MyDrawerController _myDrawerController =
      Get.put<MyDrawerController>(MyDrawerController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.white,
      child: ListView(
        children: [
          const HeightSpacer(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    behavior: HitTestBehavior.translucent,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: AppColor.black,
                    ),
                  ),
                ),
                const HeightSpacer(height: 20.0),
                Text(
                  "Menu",
                  style: const TextStyle().normal20w600,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(children: [
              ListTile(
                leading: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(50, 176, 125, 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(50, 176, 125, 0.2),
                    ),
                  ),
                  child: const Center(child: Icon(Icons.settings)),
                ),
                title: Text(
                  'Profile setting ',
                  style: const TextStyle(
                          fontFamily: TxtFontFamily.roboto,
                          color: AppColor.black)
                      .normal16w400,
                ),
                onTap: () {
                  Get.toNamed(AppRouter.changeProfileScreen);
                },
              ),
              ListTile(
                leading: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(50, 176, 125, 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(50, 176, 125, 0.2),
                    ),
                  ),
                  child: const Center(child: Icon(Icons.info_outline)),
                ),
                title: Text(
                  'Contact Us',
                  style: const TextStyle(
                          fontFamily: TxtFontFamily.roboto,
                          color: AppColor.black)
                      .normal16w400,
                ),
                onTap: () {
                  Get.toNamed(AppRouter.contactUsScreen);
                },
              ),
              ListTile(
                leading: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(50, 176, 125, 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(50, 176, 125, 0.2),
                    ),
                  ),
                  child: const Center(child: Icon(Icons.lock)),
                ),
                title: Text(
                  'Privacy Policy',
                  style: const TextStyle(
                          fontFamily: TxtFontFamily.roboto,
                          color: AppColor.black)
                      .normal16w400,
                ),
                onTap: () {

                  Get.toNamed(AppRouter.privacyPolicyPage);
                },
              ),
              ListTile(
                leading: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(50, 176, 125, 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(50, 176, 125, 0.2),
                    ),
                  ),
                  child: const Center(child: Icon(Icons.note)),
                ),
                title: Text(
                  'Terms of Use',
                  style: const TextStyle(
                          fontFamily: TxtFontFamily.roboto,
                          color: AppColor.black)
                      .normal16w400,
                ),
                onTap: () {
                  Get.toNamed(AppRouter.termsOfUser);
                },
              ),
              ListTile(
                leading: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(50, 176, 125, 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(50, 176, 125, 0.2),
                    ),
                  ),
                  child: const Center(child: Icon(Icons.logout_outlined)),
                ),
                title: Text(
                  'Log Out',
                  style: const TextStyle(
                          fontFamily: TxtFontFamily.roboto, color: AppColor.red)
                      .normal16w400,
                ),
                onTap: () {
                  showLogoutDialog(context);
                },
              ),
            ]),
          )
        ],
      ),
    );
  }

  showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          content: SizedBox(
            width: 300,
            height: 200,
            //padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.red.withOpacity(0.3)),
                    child: const Icon(
                      Icons.logout_outlined,
                      color: AppColor.red,
                    )),
                const HeightSpacer(height: 10.0),
                Text('Logout',
                    style: const TextStyle(
                            fontFamily: TxtFontFamily.roboto,
                            color: AppColor.red)
                        .normal20w600),
                const HeightSpacer(height: 10.0),
                Text('Are you sure to logout?',
                    style: const TextStyle(
                            fontFamily: TxtFontFamily.roboto,
                            color: AppColor.grey)
                        .normal20w600),
                const HeightSpacer(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: context.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColor.grey,
                        ),
                        child: Center(
                            child: Text(
                          "Cancel",
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(color: Colors.white).normal16w500,
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        _myDrawerController.apiCallForLogout();
                        // EasyLoading.show(status: 'Logging out');
                        // bool log = await AuthService().logout();
                        // EasyLoading.dismiss();

                        // if (log) {
                        //   Navigator.pop(context);
                        //   Route route = MaterialPageRoute(
                        //       builder: (context) => const HomeScreen());
                        //   Navigator.pushReplacement(context, route);
                        // } else {
                        //   Utlis.showSnackBar(
                        //       'Opps', 'Something went wrong! Try again');
                        // }
                      },
                      child: Container(
                        height: 50,
                        width: context.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColor.red,
                        ),
                        child: Center(
                            child: Text(
                          "Confirm",
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(color: Colors.white).normal16w500,
                        )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
