

import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/model/gym_deta_model.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_preferences.dart';

class GymDetailController extends GetxController {


  Rx<GymDataModel> gymDataModel =
  Rx<GymDataModel>(GymDataModel());

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

  }


