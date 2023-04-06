import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:meal_mentor/utils/http_request.dart';

import 'package:http/http.dart' as http;
import '../controller/auth/login_controller.dart';
import '../models/item_category.dart';
import '../utils/apis.dart';

class ItemRepo {
  static Future<void> getItemCategory({
    required Function(List<ItemCategory> banners) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      //  var token = StorageHelper.getToken();
      var homeController = Get.find<LoginController>();
      var headers = {
        "Accept": "application/json",
        "Authorization": homeController.bearerToken.value
      };

      http.Response response = await HttpRequest.get(
        Uri.parse(Api.item),
        headers: headers,
      );

      log(response.body);

      dynamic data = json.decode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<ItemCategory> banners = itemCategoryFromJson(data["data"]);
        onSuccess(banners);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry! something went wrong");
    }
  }
}
