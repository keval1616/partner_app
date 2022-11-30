import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/model/viewhistorymodel.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_preferences.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeController extends GetxController {
  //

  Rx<ViewHistoryModel> viewHistoryModel =
      Rx<ViewHistoryModel>(ViewHistoryModel());

  Future<void> apiCallFoQrcodedata(String barcode) async {
    Map<String, dynamic> paras = {
      "user": AppPref().userId,
      "partner": AppPref().partner_id,
    };
    try {
      final response = await ApiService.makeApiCall(
          "users/${barcode}/visits/", ApiMethodType.post,
          params: paras, doShowLoader: true);

      if (response != null) {
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$response");
        viewHistoryModel.value = ViewHistoryModel.fromJson(response);
        Get.offNamed(AppRouter.qrClientHistoryScreen);
        // update();
      }
    } catch (e) {
      return;
    }
  }
}
