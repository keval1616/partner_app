

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_app/app_route.dart';
import 'package:partner_app/schema/appcolor.dart';
import 'package:partner_app/schema/test_style.dart';
import 'package:partner_app/utils/images.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({Key? key}) : super(key: key);

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.lightgray,
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
        body: Stack(
          children: [
            Container(
              height: 50,
              color: AppColor.lightgray,
            ),
            SizedBox(height: 75,),
            Column(
              children: [
                Center(child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Image.asset(ImageConstant.gymLogo,width: 122,height: 122,),
                )),
                SizedBox(height: 30,),
                Text("SETTINGS",style: TextStyle(fontFamily: TxtFontFamily.Oswald,).normal25w600),
                SizedBox(height: 10,),
                Text("Partner’s number",style: TextStyle(fontFamily: TxtFontFamily.inter,).normal16w600),
                SizedBox(height: 5,),
                Text("4598 5985",style: TextStyle(fontFamily: TxtFontFamily.inter,color: AppColor.grey
                ).normal14w600),
                SizedBox(height: 50,),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRouter.newPasswordScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.0,right: 22),
                    child: Container(
                      height: 50,
                      width: context.width,
                      child: Center(child: Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
                          children: [
                            Text("Change data about gym ",textAlign:TextAlign.center,style: TextStyle(fontFamily: TxtFontFamily.Roboto,color: Colors.black).normal16w400,),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios,size: 18,)
                          ],
                        ),
                      )),
                      decoration: BoxDecoration(
                        color:AppColor.lightgray,

                        borderRadius: BorderRadius.circular(30),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRouter.newPasswordScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.0,right: 22),
                    child: Container(
                      height: 50,
                      width: context.width,
                      child: Center(child: Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
                          children: [
                            Text("Change email address",textAlign:TextAlign.center,style: TextStyle(fontFamily: TxtFontFamily.Roboto,color: Colors.black).normal16w400,),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios,size: 18,)
                          ],
                        ),
                      )),
                      decoration: BoxDecoration(
                        color:AppColor.lightgray,

                        borderRadius: BorderRadius.circular(30),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRouter.newPasswordScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.0,right: 22),
                    child: Container(
                      height: 50,
                      width: context.width,
                      child: Center(child: Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
                          children: [
                            Text("Change password ",textAlign:TextAlign.center,style: TextStyle(fontFamily: TxtFontFamily.Roboto,color: Colors.black).normal16w400,),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios,size: 18,)
                          ],
                        ),
                      )),
                      decoration: BoxDecoration(
                        color:AppColor.lightgray,

                        borderRadius: BorderRadius.circular(30),

                      ),
                    ),
                  ),
                ),
              ],
            )

          ],
        ),

    );
  }
}
