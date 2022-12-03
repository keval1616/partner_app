import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/controllers/home_screen_controller.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_loader.dart';
import 'package:gymui/utils/app_preferences.dart';

class ChangeEmailController extends GetxController {
  RxString emailString = "".obs;
  TextEditingController emailAddressController = TextEditingController();
  FocusNode emailAddressFocusNode = FocusNode();
  TextEditingController currentEmailController = TextEditingController();
  FocusNode currentEmailFocusNode = FocusNode();
  // Future<void> apiCallForChangeEmail() async {
  //   Map<String, dynamic> paras = {
  //     "current_email": emailAddressController.text,
  //     "email": emailAddressController.text,
  //   };
  //   try {
  //     final response = await ApiService.makeApiCall(
  //         "users/${AppPref().userId}/change-email/", ApiMethodType.post,
  //         params: paras);
  //
  //     // Get.toNamed(AppRouter.checkMailForgotScreen);
  //     if (response.statusCode == 200) {
  //       Get.offAllNamed(AppRouter.checkMailForgotScreen);
  //     } else {
  //       Get.showSnackbar(GetSnackBar(
  //         margin: EdgeInsets.all(10),
  //         padding: EdgeInsets.all(20),
  //         snackPosition: SnackPosition.TOP,
  //         borderRadius: 20,
  //         backgroundColor: AppColor.buttoncolor,
  //         duration: Duration(milliseconds: 3000),
  //         message: response['massage'],
  //       )
  //       );
  //     }
  //   } catch (e) {
  //     return;
  //   }
  // }
  Future apiCallForChangeEmail() async {
    showLoader(isCancelable: false);
    try {
      final response = await Dio().post(
          "https://stage.srv.apicalfitness.com/api/users/${AppPref().userId}/change-email/",
          data: {
            "current_email": currentEmailController.text,
            "email": emailAddressController.text
          },
          options: Options(
            validateStatus: (status) => true,
            contentType: "application/json",
              headers: {
                'Authorization': "Bearer " + AppPref().token,
              }
          ));
      print(response);
      dismissLoader();
      if (response.statusCode == 200) {
        Get.offAllNamed(AppRouter.checkMailForgotScreen);
      } else {
        Get.showSnackbar(GetSnackBar(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          snackPosition: SnackPosition.TOP,
          borderRadius: 20,
          backgroundColor: AppColor.buttoncolor,
          duration: Duration(milliseconds: 3000),
          title:"Invalid email",
          message:"please enter valid email ID",
        )
        );
      }
    } catch (error) {
      print(error);
    }
  }
}
