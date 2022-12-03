import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_loader.dart';
import 'package:gymui/utils/app_preferences.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldpasswordController = TextEditingController();
  FocusNode oldpasswordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();
  RxBool showPass = false.obs;
  RxBool oldshowPass = false.obs;
  RxBool showConfirmPass = false.obs;
  RxString userPasswordString = "".obs;
  RxString oldPasswordString = "".obs;
  RxString passwordString = "".obs;
  RxString confirmPasswordString = "".obs;

  // Future<void> apiCallForChangePassword() async {
  //   Map<String, dynamic> paras = {
  //     "current_password": oldpasswordController.text,
  //     "password": passwordController.text,
  //     "password_confirmation": confirmPasswordController.text
  //   };
  //
  //   try {
  //     final response = await ApiService.makeApiCall("users/${AppPref().userId}/change-password/", ApiMethodType.post,
  //         doShowLoader: true,params: paras);
  //
  //     if (response != null) {
  //       print("++++++++$response");
  //
  //
  //     }
  //   } catch (e) {
  //     return;
  //   }
  // }
  Future apiCallForChangePassword() async {
    showLoader(isCancelable: false);
    try {
      final response = await Dio().post(
          "https://stage.srv.apicalfitness.com/api/users/${AppPref().userId}/change-password/",
          data: {
            "current_password": oldpasswordController.text,
            "password": passwordController.text,
            "password_confirmation": confirmPasswordController.text
          },
          options: Options(
              validateStatus: (status) => true,
              contentType: "application/json",
              
              headers: {
                'Authorization': "Bearer " + AppPref().token,
              }));
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
          title: "Wrong Password",
          message: response.data['error'],
        ));
      }
    } catch (error) {
      print(error);
    }
  }
}
