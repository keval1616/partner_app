import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/auth_screens/forgotpassword/check_mail.dart';
import 'package:gymui/components/commonappbutton.dart';
import 'package:gymui/components/input_field.dart';
import 'package:gymui/controllers/forgotpasswordcontroller.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/utils/enum.dart';
import 'package:gymui/utils/velidation_utils.dart';
import 'package:gymui/widgets/height_spacer.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final forgotPasswordScreenController =
      Get.put(ForgotPasswordScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forget Password',
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
        padding: const EdgeInsets.only(top: 60.0, right: 25, left: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 45),
                child: Text(
                  "Enter your account emeil to recover a password",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontFamily: TxtFontFamily.roboto)
                      .normal16w600,
                ),
              ),
              const HeightSpacer(height: 100.0),
              Text(
                "Account Email",
                textAlign: TextAlign.start,
                style: const TextStyle(
                        fontFamily: TxtFontFamily.roboto, color: Colors.black26)
                    .normal17w600,
              ),
              const HeightSpacer(height: 10.0),
              InputField(
                maxLine: 1,
                onChange: (val) {
                  forgotPasswordScreenController.emailString.value = val ?? "";
                },
                controller:
                    forgotPasswordScreenController.emailAddressController,
                focusNode: forgotPasswordScreenController.emailAddressFocusNode,
                hint: "Email address",
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 350,
              ),
              Obx(
                () => CommonAppButton(
                  buttonType: (forgotPasswordScreenController
                              .emailString.value.isNotEmpty &&
                          ValidationUtils.validateEmail(
                              forgotPasswordScreenController.emailString
                                  .toString()))
                      ? ButtonType.enable
                      : ButtonType.disable,
                  borderRadius: 30,
                  onTap: () async {
                    forgotPasswordScreenController.apiCallForForgotPassword();
                 
                  },
                  text: "CHECK EMAIL",
                ),
              ),
              const HeightSpacer(height: 60.0)
            ],
          ),
        ),
      ),
    );
  }
}
