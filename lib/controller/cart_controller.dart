import 'package:get/get.dart';
import 'package:meal_mentor/models/meal_mentor_item.dart';

class CartController extends GetxController{


  RxList<MealMentorItem> cartItem = <MealMentorItem>[].obs;

}