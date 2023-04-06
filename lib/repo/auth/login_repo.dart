import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meal_mentor/utils/http_request.dart';

import '../../controller/core_controller.dart';
import '../../models/user.dart';

import 'package:http/http.dart' as http;

import '../../utils/apis.dart';
import '../../utils/storage_keys.dart';

class LoginRepo {
  static Future<void> login({
    required String email,
    required String password,
    required Function(
            User user,
            String token
            )
        onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        // "Content-Type": "application/json",
      };
      var body = {
        "email": email,
        "password": password,
      };
      http.Response response = await HttpRequest.post(Uri.parse(Api.login),
          headers: headers, body: body);

      log("${Api.login} ===================>");
      log(json.encode(body));
      log(response.body);
      dynamic data = jsonDecode(response.body);
      if (data["status"] == "success") {
        // User user = User.fromJson(data["data"]["user"]);
        // final box = GetStorage();
        // await box.write(
        //     StorageKeys.ACCESS_TOKEN, json.encode(data["data"]["token"]));
        String token = json.encode(data["data"]["token"]);
        // await box.write(StorageKeys.USER, data["data"]["user"]);
        // Get.find<CoreController>().loadCurrentUser();
        // print('------token ---------${token.toString()}');
           User user = User.fromJson(data["data"]["user"]);
        onSuccess(
           user,token

        );
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}
