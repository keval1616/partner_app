import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/components/commonappbutton.dart';
import 'package:gymui/components/input_field.dart';
import 'package:gymui/controllers/changeemailcontroller.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/screens/profile_settings/changeemail/checkmailforgotmail_Screen.dart';
import 'package:gymui/utils/enum.dart';
import 'package:gymui/utils/velidation_utils.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({Key? key}) : super(key: key);

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}


class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final changeEmailController = Get.put(ChangeEmailController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Change Email',
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
                    "You will have to confirm new email",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontFamily: TxtFontFamily.roboto)
                        .normal16w600,
                  ),
                ),
                const SizedBox(height: 100),
                Text(
                  "Type Current Email",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontFamily: TxtFontFamily.roboto, color: Colors.black26)
                      .normal17w600,
                ),

                const SizedBox(
                  height: 10,
                ),

                InputField(
                  maxLine: 1,
                  controller: changeEmailController.currentEmailController,
                  focusNode: changeEmailController.currentEmailFocusNode,
                  hint: "Enter Current Email",
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),

                Text(
                  "Type New Email",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                          fontFamily: TxtFontFamily.roboto, color: Colors.black26)
                      .normal17w600,
                ),
                const SizedBox(
                  height: 10,
                ),


                InputField(
                  maxLine: 1,
                  onChange: (val) {
                    changeEmailController.emailString.value = val ?? "";
                  },
                  controller: changeEmailController.emailAddressController,
                  focusNode: changeEmailController.emailAddressFocusNode,
                  hint: "abc@gmail.com",
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 200,
                ),
                Obx(
                  () => CommonAppButton(
                    buttonType:
                        (changeEmailController.emailString.value.isNotEmpty &&
                                ValidationUtils.validateEmail(
                                    changeEmailController.emailString.toString()))
                            ? ButtonType.enable
                            : ButtonType.disable,
                    borderRadius: 30,
                    onTap: () async {
                      changeEmailController.apiCallForChangeEmail();
                     // Get.to(() => const CheckMailForgotScreen());
                      // forgotPasswordScreenController
                      //     .apiCallForForgotPassword();
                      // if (formKey.currentState!.validate()) {
                      //   Get.toNamed(AppRouter.selectCityScreen);
                      // } else {}
                    },
                    text: "CHANGE EMAIL",
                  ),
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
