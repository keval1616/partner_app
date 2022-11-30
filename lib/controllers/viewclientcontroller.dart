import 'package:get/get.dart';
import 'package:gymui/controllers/historytab_controller.dart';
import 'package:gymui/model/viewclientmodel.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_preferences.dart';

class ViewClientController extends GetxController {
  Rx<ViewClientModel> viewClientModel = Rx<ViewClientModel>(ViewClientModel());

  Future<void> apiCallFoHistoryData(int? id) async {
    viewClientModel.value = ViewClientModel();
    try {
      final response = await ApiService.makeApiCall(
          "users/$id/visit-info/", ApiMethodType.get,
          doShowLoader: true);

      if (response != null) {
        viewClientModel.value = ViewClientModel.fromJson(response);
        print(response);
      }
    } catch (e) {
      return;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
