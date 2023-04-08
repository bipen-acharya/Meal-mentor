import 'dart:developer';

import 'package:get/get.dart';
import 'package:meal_mentor/models/past_order.dart';
import 'package:meal_mentor/repo/order_repo.dart';

import '../utils/custom_snackbar.dart';

class OrderController extends GetxController {
  @override
  void onInit() {
    getAllPastorder();
    super.onInit();
  }

  RxBool loading = RxBool(false);
  RxBool showDetails = false.obs;

  RxBool pastDetails = false.obs;

  RxList<PastOrder> pastOrders = <PastOrder>[].obs;

  getAllPastorder() async {
    loading.value = true;
    await PastOrderRepo.getPastOrder(
      onSuccess: (orders) {
        loading.value = false;
        pastOrders.addAll(orders);
        log('--------->>>>>>>>>>>.length ${pastOrders[0].orderableItems![0].itemName!.name}');
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "PastOrder", message: message);
      }),
    );
  }
}
