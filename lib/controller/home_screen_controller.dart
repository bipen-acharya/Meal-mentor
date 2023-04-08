import 'dart:developer';

import 'package:get/get.dart';
import 'package:meal_mentor/models/item_category.dart';

import '../repo/item_category_repo.dart';
import '../utils/custom_snackbar.dart';

class HomeController extends GetxController {
  RxBool loading = RxBool(false);

  RxList<ItemCategory> itemCategory = <ItemCategory>[].obs;
  RxInt selectedIndex = 0.obs;
  @override
  void onInit() {
    getAllCategory();
    super.onInit();
  }

  getAllCategory() async {
    loading.value = true;
    await ItemRepo.getCategory(
      onSuccess: (items) {
        log('--------->>>>>>>>>>>.length ${itemCategory.length}');
        loading.value = false;
        itemCategory.addAll(items);
        log('--------->>>>>>>>>>>.length ${itemCategory.length}');
        final firstCategory =
            itemCategory.isNotEmpty ? itemCategory[0].id : null;
        log('--------->>>>>>>>>>>.first category index $firstCategory');
        selectedIndex.value = firstCategory!.toInt();
        log('--------->>>>>>>>>>>.selected index ${selectedIndex.value}');
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Item Category", message: message);
      }),
    );
  }


  getAllByCategory() async {
    loading.value = true;
    await ItemRepo.getCategory(
      onSuccess: (items) {
        log('--------->>>>>>>>>>>.length ${itemCategory.length}');
        loading.value = false;
        itemCategory.addAll(items);
        log('--------->>>>>>>>>>>.length ${itemCategory.length}');
        final firstCategory =
            itemCategory.isNotEmpty ? itemCategory[0].id : null;
        log('--------->>>>>>>>>>>.first category index $firstCategory');
        selectedIndex.value = firstCategory!.toInt();
        log('--------->>>>>>>>>>>.selected index ${selectedIndex.value}');
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Item Category", message: message);
      }),
    );
  }
}
