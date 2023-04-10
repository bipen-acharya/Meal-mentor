import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:meal_mentor/models/meal_mentor_item.dart';
import 'package:meal_mentor/models/meal_mentor_table.dart';
import 'package:meal_mentor/repo/table_repo.dart';

import '../repo/order_repo.dart';
import '../utils/apis.dart';
import '../utils/custom_snackbar.dart';
import '../utils/storage_keys.dart';

class CartController extends GetxController {
  RxList<MealMentorItem> cartItem = <MealMentorItem>[].obs;

  final selectedTable = MealMentorTable().obs;
  void incrementItemQuantity(MealMentorItem item) {
    final index = cartItem.indexWhere((x) => x.id == item.id);
    if (index != -1) {
      cartItem[index].itemCount++;
    }
    cartItem.refresh();
  }

  void setSelectedTable(MealMentorTable table) {
    selectedTable.value = table;
  }

  void decrementItemQuantity(MealMentorItem item) {
    final index = cartItem.indexWhere((x) => x.id == item.id);
    if (index != -1) {
      final count = cartItem[index].itemCount;
      if (count > 1) {
        cartItem[index].itemCount--;
      }
      //  else {
      //   cartItem.removeAt(index);
      // }
    }
    cartItem.refresh();
  }

  void removeItem(MealMentorItem item) {
    cartItem.remove(item);
    cartItem.refresh();
  }

  @override
  void onInit() {
    getAllTables();
    super.onInit();
  }

  RxBool loading = RxBool(false);

  RxList<MealMentorTable> allTableList = <MealMentorTable>[].obs;

  getAllTables() async {
    loading.value = true;
    await TableRepo.getTable(
      onSuccess: (table) {
        loading.value = false;
        allTableList.addAll(table);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "PastOrder", message: message);
      }),
    );
  }

  static Future<void> sendPosOrder({
    required var items,
    required Function() onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var token = StorageHelper.getToken();
      var headers = {
        "Accept": "application/json",
        "Authorization": token.toString(),
        "content-type": "application/json"
      };

      var body = json.encode(items);
      log("url ------------${Uri.parse(Api.postOrder)}");
      log('--------json enconded ---------$body');
      http.Response response = await http.post(Uri.parse(Api.postOrder),
          headers: headers, body: body);

      dynamic data = json.decode(response.body);
      print(data);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        log("past order");
        onSuccess();
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry! something went wrong");
    }
  }

  // sendPosOrder(var items) async {
  //   // sendRequest.show(message: "Sending Order");
  //   log("items: -------items ahru aayo --->>>>>>>>>....$items");
  //   await MealMentorOrderRepo.postOrder(
  //       items: items,
  //       onSuccess: () {
  //         CustomSnackBar.success(
  //             title: "Order", message: "Order placed successfully");
  //       },
  //       onError: (message) {
  //         // sendRequest.hide();
  //         CustomSnackBar.error(title: "Order", message: message);
  //       });
  // }
}
