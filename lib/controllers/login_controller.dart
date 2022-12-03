import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/screens/home_screen.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_loader.dart';
import 'package:gymui/utils/app_preferences.dart';

class LoginScreenController extends GetxController {
  TextEditingController userEmailController = TextEditingController();
  FocusNode userEmailFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  RxString userEmailString = "".obs;
  RxString userPasswordString = "".obs;
  RxBool showPass = false.obs;

  // Future<void> userSignInApiCall() async {
  //   Map<String, dynamic> paras = {
  //     "username": userEmailController.text,
  //     "password": passwordController.text
  //   };
  //   try {
  //     final response = await ApiService.makeApiCall(
  //         "auth/token/", ApiMethodType.post,
  //         params: paras);
  //     if (kDebugMode) {
  //       print("response===>$response");
  //     }
  //     AppPref().token = response['access'];
  //     AppPref().refreshToken = response['refresh'];

  //     Route route = MaterialPageRoute(builder: (context) => const HomeScreen());
  //     Navigator.pushReplacement(Get.context!, route);
  //   } catch (e) {
  //     return;
  //   }
  // }
  Future userSignInApiCall() async {
    showLoader(isCancelable: false);
    try {
      final response = await Dio().post(
          "https://stage.srv.apicalfitness.com/api/auth/token/",
          data: {
            "username": userEmailController.text,
            "password": passwordController.text
          },
          options: Options(
            validateStatus: (status) => true,
            contentType: "application/json",
          ));
      print(response);
      dismissLoader();
      if (response.statusCode == 200) {
        // print(response.data);
        AppPref().token = response.data['access'];
        AppPref().refreshToken = response.data['refresh'];
        Get.offAllNamed(AppRouter.homeScreen);
      } else {
        Get.showSnackbar(GetSnackBar(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          snackPosition: SnackPosition.TOP,
        borderRadius: 20,
          backgroundColor: AppColor.buttoncolor,
          duration: Duration(milliseconds: 3000),
          message: response.data['detail'],
        )
        );
      }
    } catch (error) {
      print(error);
    }
  }

  // Future loginApi() async {
  //   try {
  //     final response = await Dio()
  //         .post("https://stage.srv.apicalfitness.com/api/auth/token/",
  //             data: {
  //               "username": "test@test.com",
  //               "password": "Qwerty123",
  //             },
  //             options: Options(
  //               validateStatus: (status) => true,
  //               contentType: "application/json",
  //             ));
  //     print(response);

  //     if (response.statusCode == 200) {
  //       // print(response.data);
  //       // refreshToken = response.data['refresh'];
  //       // print("_+_+_+_+_+_+_+__$refreshToken");
  //       // token = response.data['access'];
  //       return response.data;
  //     } else {
  //       return Future.error(
  //           "This is the error", StackTrace.fromString("This is its trace"));
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  @override
  void onInit() {
    // TODO: implement onInit

    // loginApi();
    super.onInit();
  }
}
