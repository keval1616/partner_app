

import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/model/GetContectModel.dart';
import 'package:gymui/model/gym_deta_model.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_preferences.dart';

class GymDetailController extends GetxController {


  Rx<GymDataModel> gymDataModel =
  Rx<GymDataModel>(GymDataModel());
  Rx<GetContectModel> getContectModel = Rx<GetContectModel>(GetContectModel());

  Future<void> apiCallFoGymdata() async {
    try {
      final response = await ApiService.makeApiCall("partners/${AppPref().partner_id}/", ApiMethodType.get,
          doShowLoader: true);

      if (response != null) {

        gymDataModel.value = GymDataModel.fromJson(response);
        print(gymDataModel.value);
        print(response);
        Get.toNamed(AppRouter.gymDetails);

      }
    } catch (e) {
      return;
    }
  }
  Future<void> apiCallForContactInformation() async {
    try {
      final response = await ApiService.makeApiCall(
          "partners/${AppPref().partner_id}/contact-information/",
          ApiMethodType.get,
          doShowLoader: true);

      if (response != null) {
        getContectModel.value = GetContectModel.fromJson(response);
        print(getContectModel);
        print(response);
        // Get.toNamed(AppRouter.changeGymData);
      }
    } catch (e) {
      return;
    }
  }

  }


