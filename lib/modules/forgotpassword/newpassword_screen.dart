import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get.dart';
import 'package:partner_app/app_route.dart';
import 'package:partner_app/components/commonappbutton.dart';
import 'package:partner_app/components/input_field.dart';
import 'package:partner_app/modules/forgotpassword/newpasswordcontroller.dart';
import 'package:partner_app/schema/appcolor.dart';
import 'package:partner_app/schema/test_style.dart';
import 'package:partner_app/utils/enum.dart';
import 'package:partner_app/utils/velidation_utils.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final newPasswordController =
      Get.put<NewPasswordController>(NewPasswordController());
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
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 80),
                child: Text(
                  "Your new password must be different from preiously used password",
                  textAlign: TextAlign.center,
                  style: TextStyle().normal16w600,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => squerInputField(
                  onChange: (val) {
                    newPasswordController.passwordString.value = val ?? "";
                  },
                  maxLine: 1,
                  obscureText: !newPasswordController.showPass.value,
                  controller: newPasswordController.passwordController,
                  focusNode: newPasswordController.passwordFocusNode,
                  hint: "Password",
                  textInputAction: TextInputAction.next,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      newPasswordController.showPass.value =
                          !newPasswordController.showPass.value;

                      if (mounted) {
                        setState(() {});
                      }
                    },
                    child: Icon(
                      newPasswordController.showPass.value
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
                controller: newPasswordController.passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => squerInputField(
                  onChange: (val) {
                    newPasswordController.confirmPasswordString.value = val ?? "";
                  },
                  maxLine: 1,
                  obscureText: !newPasswordController.showConfirmPass.value,
                  controller: newPasswordController.confirmPasswordController,
                  focusNode: newPasswordController.confirmPasswordFocusNode,
                  hint: "Confirm Password",
                  textInputAction: TextInputAction.done,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      newPasswordController.showConfirmPass.value =
                          !newPasswordController.showConfirmPass.value;

                      if (mounted) {
                        setState(() {});
                      }
                    },
                    child: Icon(
                      newPasswordController.showConfirmPass.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: AppColor.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Obx(
                () => CommonAppButton(
                  buttonType: (newPasswordController
                              .confirmPasswordString.value.isNotEmpty &&
                          (newPasswordController.confirmPasswordString.value ==
                              newPasswordController.passwordString.value))
                      ? ButtonType.enable
                      : ButtonType.disable,
                  borderRadius: 30,
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    Get.toNamed(AppRouter.successChangePasswordScreen);
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
    );
  }
}
