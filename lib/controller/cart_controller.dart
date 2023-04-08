import 'package:get/get.dart';
import 'package:meal_mentor/models/meal_mentor_item.dart';
import 'package:meal_mentor/models/meal_mentor_table.dart';
import 'package:meal_mentor/repo/table_repo.dart';

import '../utils/custom_snackbar.dart';

class CartController extends GetxController {
  RxList<MealMentorItem> cartItem = <MealMentorItem>[].obs;

  void incrementItemQuantity(MealMentorItem item) {
    final index = cartItem.indexWhere((x) => x.id == item.id);
    if (index != -1) {
      cartItem[index].itemCount++;
    }
    cartItem.refresh();
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
}
