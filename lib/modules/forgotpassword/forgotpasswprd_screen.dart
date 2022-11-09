import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_app/app_route.dart';
import 'package:partner_app/components/commonappbutton.dart';
import 'package:partner_app/components/input_field.dart';
import 'package:partner_app/modules/forgotpassword/forgotpasswordcontroller.dart';
import 'package:partner_app/schema/appcolor.dart';
import 'package:partner_app/schema/test_style.dart';
import 'package:partner_app/utils/enum.dart';
import 'package:partner_app/utils/velidation_utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final forgotPasswordScreenController =
      Get.put<ForgotPasswordScreenController>(ForgotPasswordScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 137.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
                child: Text(
              "FORGOT PASSWORD",
              style: TextStyle(fontFamily: 'Oswald').normal25w600,
            )),
            Padding(
              padding: const EdgeInsets.only(top: 9.0, left: 70, right: 70),
              child: Text(
                "Enter your account emeil to recover a password",
                textAlign: TextAlign.center,
                style: TextStyle().normal16w600,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: squerInputField(
                maxLine: 1,
                onChange: (val) {
                  forgotPasswordScreenController.emailString.value = val ?? "";
                },
                controller: forgotPasswordScreenController.emailAddressController,
                focusNode: forgotPasswordScreenController.emailAddressFocusNode,
                hint: "Account email",
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: CommonAppButton(
                  buttonType: (forgotPasswordScreenController
                              .emailString.value.isNotEmpty &&
                          ValidationUtils.validateEmail(
                              forgotPasswordScreenController.emailString
                                  .toString()))
                      ? ButtonType.enable
                      : ButtonType.disable,
                  borderRadius: 5,
                  onTap: () async {
                    Get.toNamed(AppRouter.forgotMailScreen);
                  },
                  text: "RECOVER PASSWORD",
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    width: context.width,
                    child: Center(
                        child: Text(
                      "CANCEL",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'inter', color: Colors.green)
                          .normal14w500,
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.green)),
                  ),
                )),
            const SizedBox(
              height: 60,
            ),
          ]),
        ),
      ),
    );
  }
}
