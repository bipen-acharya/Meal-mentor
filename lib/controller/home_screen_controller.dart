import 'dart:developer';

import 'package:get/get.dart';
import 'package:meal_mentor/models/meal_mentor_category.dart';
import 'package:meal_mentor/models/meal_mentor_item.dart';

import '../repo/category_repo.dart';
import '../utils/custom_snackbar.dart';

class HomeController extends GetxController {
  RxBool loading = RxBool(false);
  RxBool loading1 = RxBool(false);

  RxList<MealMentorCategory> itemCategory = <MealMentorCategory>[].obs;
  RxList<MealMentorItem> itmeByCategory = <MealMentorItem>[].obs;

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
        getAllItemByCategory(selectedIndex.value);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Item Category", message: message);
      }),
    );
  }

  getAllItemByCategory(int id) async {
    loading1.value = true;
    print("item by category");
    itmeByCategory.clear();
    await ItemRepo.getItemByCategory(
      id: id,
      onSuccess: (items) {
        loading1.value = false;
        itmeByCategory.addAll(items);
        log('--------->>>>>>>>>>item by category>.length ${itmeByCategory.length}');
      },
      onError: ((message) {
        loading1.value = false;
        CustomSnackBar.error(title: "Item Category", message: message);
      }),
    );
  }
}
