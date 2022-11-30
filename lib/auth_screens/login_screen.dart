// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/auth_screens/forgotpassword/check_mail.dart';
import 'package:gymui/auth_screens/forgotpassword/forgotpasswprd_screen.dart';
import 'package:gymui/components/commonappbutton.dart';
import 'package:gymui/components/input_field.dart';
import 'package:gymui/controllers/login_controller.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/screens/home_screen.dart';
import 'package:gymui/services/auth_service.dart';
import 'package:gymui/utils.dart';
import 'package:gymui/utils/enum.dart';
import 'package:gymui/utils/velidation_utils.dart';
import 'package:gymui/widgets/height_spacer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginScreenController = Get.put(LoginScreenController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusManager.instance.primaryFocus!.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 19.0, right: 26, top: 92),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  'assets/images/appIcon.png',
                  width: 102,
                  height: 37,
                )),
                const HeightSpacer(height: 20.0),
                Center(
                    child: Text("Welcome to LifeTime!",
                        style: const TextStyle(fontFamily: TxtFontFamily.inter)
                            .normal16w600
                            .textColor(AppColor.grey))),
                const HeightSpacer(height: 30.0),
                Text("Email or phone number ",
                    style: const TextStyle(fontFamily: TxtFontFamily.inter)
                        .normal16w400
                        .textColor(AppColor.black)),
                const HeightSpacer(height: 15.0),
                InputField(
                  maxLine: 1,
                  onChange: (val) {
                    loginScreenController.userEmailString.value = val ?? "";
                  },
                  controller: loginScreenController.userEmailController,
                  focusNode: loginScreenController.userEmailFocusNode,
                  hint: "example@abc.com",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                const HeightSpacer(height: 15.0),
                Text("Choose a password",
                    style: const TextStyle(fontFamily: TxtFontFamily.inter)
                        .normal16w400
                        .textColor(AppColor.black)),
                const HeightSpacer(height: 15.0),
                Obx(
                  () => InputField(
                    onChange: (val) {
                      loginScreenController.userPasswordString.value = val ?? "";
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
                const HeightSpacer(height: 12.0),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRouter.forgotPasswordScreen);
                        },
                        child: Text("Forgot Password?",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                    fontFamily: TxtFontFamily.inter,
                                    color: AppColor.buttoncolor)
                                .normal16w600
                                .textColor(Colors.green)))),
                const HeightSpacer(height: 15.0),
                Obx(
                  () => CommonAppButton(
                    buttonType:
                        (loginScreenController.userEmailString.value.isNotEmpty &&
                                loginScreenController
                                    .userPasswordString.value.isNotEmpty &&
                                ValidationUtils.validateEmail(
                                    loginScreenController.userEmailString.value))
                            ? ButtonType.enable
                            : ButtonType.disable,
                    borderRadius: 100,
                    onTap: () async {
                      loginScreenController.userSignInApiCall();
                      // EasyLoading.show(status: 'Please Wait');
                      // bool log = await AuthService().signIn(
                      //     loginScreenController.userEmailController.value.text,
                      //     loginScreenController.passwordController.value.text);
                      // EasyLoading.dismiss();

                      // if (log) {
                      //   Route route = MaterialPageRoute(
                      //       builder: (context) => const HomeScreen());
                      //   Navigator.pushReplacement(context, route);
                      // } else {
                      //   Utlis.showSnackBar(
                      //       'Opps', 'Something went wrong! Try again');
                      // }
                    },
                    text: "LOG IN  >",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
