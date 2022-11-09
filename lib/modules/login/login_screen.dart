import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_app/app_route.dart';
import 'package:partner_app/components/commonappbutton.dart';
import 'package:partner_app/components/input_field.dart';
import 'package:partner_app/modules/login/login_controller.dart';
import 'package:partner_app/schema/appcolor.dart';
import 'package:partner_app/schema/test_style.dart';
import 'package:partner_app/utils/enum.dart';
import 'package:partner_app/utils/images.dart';
import 'package:partner_app/utils/velidation_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final loginScreenController =
  Get.put<LoginScreenController>(LoginScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 19.0,right: 26,top: 92),
        child: SingleChildScrollView(
          child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(ImageConstant.appicon,width: 102,height: 37,)),
              SizedBox(height: 20,),
              Center(child: Text("Welcome to LifeTime!",style: const TextStyle(fontFamily: TxtFontFamily.inter).normal16w600.textColor(AppColor.grey))),
              SizedBox(height: 30,),
              Text("Email or phone number ",style: const TextStyle(fontFamily: TxtFontFamily.inter).normal16w400.textColor(AppColor.black)),
              SizedBox(height: 15,),
              InputField(
                maxLine: 1,
                onChange: (val) {
                  loginScreenController.userEmailString.value =
                      val ?? "";
                },
                controller: loginScreenController.userEmailController,
                focusNode: loginScreenController.userEmailFocusNode,
                hint: "example@.com",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15,),
              Text("Choose a password",style: const TextStyle(fontFamily: TxtFontFamily.inter).normal16w400.textColor(AppColor.black)),
              SizedBox(height: 15,),
              Obx(()=>
                 InputField(
                  onChange: (val) {
                    loginScreenController.userPasswordString.value =
                        val ?? "";
                  },
                  maxLine: 1,
                  obscureText: !loginScreenController.showPass.value,
                  controller: loginScreenController.passwordController,
                  focusNode: loginScreenController.passwordFocusNode,
                  hint: "Password",
                  textInputAction: TextInputAction.done,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      loginScreenController.showPass.value =
                      !loginScreenController.showPass.value;

                      if (mounted) {
                        setState(() {});
                      }
                    },
                    child: Icon(
                      loginScreenController.showPass.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: AppColor.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Align(
                alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRouter.forgotPasswordScreen);
                      },
                      child: Text("Forgot Password?", textAlign: TextAlign.center,style: const TextStyle(fontFamily: TxtFontFamily.inter).normal16w600.textColor(Colors.green)))),
              SizedBox(height: 15),
              Obx(() =>
                CommonAppButton(
                  buttonType: (loginScreenController
                      .userEmailString.value.isNotEmpty &&
                      loginScreenController
                          .userPasswordString.value.isNotEmpty &&
                      ValidationUtils.validateEmail(
                          loginScreenController
                              .userEmailString.value))
                      ? ButtonType.enable
                      : ButtonType.disable,
                  borderRadius: 100,
                  onTap: () async {
Get.toNamed(AppRouter.homeScreen);
                  },
                  text: "LOG IN  >",
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}