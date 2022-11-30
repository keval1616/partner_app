import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/components/commonappbutton.dart';
import 'package:gymui/components/input_field.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/screens/profile_settings/changepassword/changepasswordcontroller.dart';
import 'package:gymui/utils/enum.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

final changePasswordController = Get.put(ChangePasswordController());

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusManager.instance.primaryFocus!.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
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
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 80),
                  child: Text(
                    "Your new password must be different from preiously used password",
                    textAlign: TextAlign.center,
                    style: const TextStyle().normal16w600,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => InputField(
                    onChange: (val) {
                      changePasswordController.oldPasswordString.value =
                          val ?? "";
                    },
                    maxLine: 1,
                    obscureText: !changePasswordController.showPass.value,
                    controller: changePasswordController.oldpasswordController,
                    focusNode: changePasswordController.oldpasswordFocusNode,
                    hint: " Old Password",
                    textInputAction: TextInputAction.done,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordController.showPass.value =
                            !changePasswordController.showPass.value;

                        if (mounted) {
                          setState(() {});
                        }
                      },
                      child: Icon(
                        changePasswordController.showPass.value
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
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
                const SizedBox(height: 15),
                Obx(
                  () => InputField(
                    onChange: (val) {
                      changePasswordController.passwordString.value = val ?? "";
                    },
                    maxLine: 1,
                    obscureText: !changePasswordController.showPass.value,
                    controller: changePasswordController.passwordController,
                    focusNode: changePasswordController.passwordFocusNode,
                    hint: "Password",
                    textInputAction: TextInputAction.next,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordController.showPass.value =
                            !changePasswordController.showPass.value;

                        if (mounted) {
                          setState(() {});
                        }
                      },
                      child: Icon(
                        changePasswordController.showPass.value
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                FlutterPwValidator(
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  width: 400,
                  height: 103,
                  minLength: 6,
                  onSuccess: () {},
                  controller: changePasswordController.passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => InputField(
                    onChange: (val) {
                      changePasswordController.confirmPasswordString.value =
                          val ?? "";
                    },
                    maxLine: 1,
                    obscureText: !changePasswordController.showConfirmPass.value,
                    controller:
                        changePasswordController.confirmPasswordController,
                    focusNode: changePasswordController.confirmPasswordFocusNode,
                    hint: "Confirm Password",
                    textInputAction: TextInputAction.done,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordController.showConfirmPass.value =
                            !changePasswordController.showConfirmPass.value;

                        if (mounted) {
                          setState(() {});
                        }
                      },
                      child: Icon(
                        changePasswordController.showConfirmPass.value
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                Obx(
                  () => CommonAppButton(
                    buttonType: (changePasswordController
                                .confirmPasswordString.value.isNotEmpty &&
                            (changePasswordController
                                    .confirmPasswordString.value ==
                                changePasswordController.passwordString.value))
                        ? ButtonType.enable
                        : ButtonType.disable,
                    borderRadius: 30,
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      changePasswordController.apiCallForChangePassword();
                    },
                    text: "CREATE PASSWORD",
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
