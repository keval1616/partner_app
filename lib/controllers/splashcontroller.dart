


import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/utils/app_preferences.dart';


  class SplashScreenController extends GetxController {
  @override
  void onReady() {
  _startApp();
  super.onReady();
  }

  void _startApp() async{

  Future.delayed(const Duration(seconds: 2), () async {
  if (AppPref().token.isNotEmpty) {
  // await globalcontroller.apiCallForLastLogin();
  Get.offAndToNamed(AppRouter.homeScreen);

  }
  else {
  Get.offAndToNamed(AppRouter.loginScreen);
  }
  });
  }
  }
