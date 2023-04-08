import 'package:get/get.dart';
import 'package:meal_mentor/models/meal_mentor_item.dart';

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
}
