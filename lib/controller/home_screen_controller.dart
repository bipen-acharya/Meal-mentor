import 'package:get/get.dart';
import 'package:meal_mentor/models/item_category.dart';

import '../repo/item_category_repo.dart';
import '../utils/custom_snackbar.dart';

class HomeController extends GetxController {
  RxBool loading = RxBool(false);

  RxList<ItemCategory> itemCategory = RxList();

  @override
  void onInit() {
    getAllCategory();
    super.onInit();
  }

  getAllCategory() async {
    loading.value = true;
    await ItemRepo.getItemCategory(
      onSuccess: (items) {
        loading.value = false;
        itemCategory.addAll(items);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Item Category", message: message);
      }),
    );
  }
}
