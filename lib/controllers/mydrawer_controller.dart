import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_preferences.dart';

class MyDrawerController extends GetxController {
  Future<void> apiCallForLogout() async {
    Map<String, dynamic> paras = {"refresh": AppPref().refreshToken};
    try {
      final response = await ApiService.makeApiCall(
          "auth/logout/", ApiMethodType.post,
          params: paras);
      print(response);
      AppPref().clear();
      Get.offAllNamed(AppRouter.loginScreen);
    } catch (e) {
      return;
    }
  }
}
