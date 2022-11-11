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
       padding: const EdgeInsets.only(top: 60.0,right: 25,left: 25),
       child: SingleChildScrollView(
         child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.only(left: 45.0,right: 45),
               child: Text("Enter your account emeil to recover a password",textAlign:TextAlign.center,style: TextStyle(fontFamily:TxtFontFamily.Roboto).normal16w600,),
             ),
SizedBox(height: 100),
             Text("Account Email",textAlign:TextAlign.start,style: TextStyle(fontFamily:TxtFontFamily.Roboto,color: Colors.black26).normal17w600,),
             SizedBox(height: 10,),
             InputField(
               maxLine: 1,
               onChange: (val) {
                 forgotPasswordScreenController
                     .emailString.value = val ?? "";
               },
               controller: forgotPasswordScreenController
                   .emailAddressController,
               focusNode: forgotPasswordScreenController
                   .emailAddressFocusNode,
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
                         forgotPasswordScreenController
                             .emailString
                             .toString()))
                     ? ButtonType.enable
                     : ButtonType.disable,
                 borderRadius: 30,
                 onTap: () async {
                   Get.toNamed(AppRouter.checkmailpassword_screen);
                   // forgotPasswordScreenController
                   //     .apiCallForForgotPassword();
                   // if (formKey.currentState!.validate()) {
                   //   Get.toNamed(AppRouter.selectCityScreen);
                   // } else {}
                 },
                 text: "CHECK EMAIL",
               ),
             ),
             SizedBox(
               height: 60,
             )
           ],
         ),
       ),
     ),
    );
  }
}
