import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_app/schema/appcolor.dart';
import 'package:partner_app/schema/test_style.dart';
import 'package:partner_app/utils/images.dart';

class MyDrawer extends StatelessWidget {


  MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.white,
      child: ListView(
        children: [
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
                Text("Menu",style: TextStyle().normal20w600,)
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
                leading: Image.asset(
                  ImageConstant.setting,
                  height: 50,
                  width: 50,
                ),
                title: Text(
                  'home',
                  style: const TextStyle(
                      fontFamily: TxtFontFamily.gilroy,
                      color: AppColor.grey)
                      .normal16w100,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // ListTile(
              //   leading: Image.asset(
              //     ImageConstant.privacy,
              //     height: 20,
              //   ),
              //   title: Text(
              //     'Leader board',
              //     style: const TextStyle(
              //         fontFamily: TxtFontFamily.gilroy,
              //         color: AppColor.grey)
              //         .normal16w100,
              //   ),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
              // ListTile(
              //   leading: Image.asset(
              //     ImageConstant.terms,
              //     height: 20,
              //   ),
              //   title: Text(
              //     'Spaces',
              //     style: const TextStyle(
              //         fontFamily: TxtFontFamily.gilroy,
              //         color: AppColor.grey)
              //         .normal16w100,
              //   ),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
              // ListTile(
              //   leading: Image.asset(
              //     ImageConstant.logout,
              //     height: 20,
              //   ),
              //   title: Text(
              //     'Profile',
              //     style: const TextStyle(
              //         fontFamily: TxtFontFamily.gilroy,
              //         color: AppColor.grey)
              //         .normal16w100,
              //   ),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),

            ]),
          )
        ],
      ),
    );
  }

}