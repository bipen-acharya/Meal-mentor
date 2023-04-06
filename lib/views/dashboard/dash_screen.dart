import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_mentor/controller/order_controller.dart';
import 'package:meal_mentor/views/dashboard/profile_screen.dart';
import '../../../utils/colors.dart';
import '../../controller/dash_screen_controller.dart';
import '../../controller/home_screen_controller.dart';
import '../../controller/profile_controller.dart';
import 'home_screen.dart';
import '../order/order_screen.dart';

class DashScreen extends StatelessWidget {
  static const routeName = '/dash-screen';

  DashScreen({super.key});
  // final coreController = Get.find<CoreController>();
  final c = Get.put(DashScreenController());
  // final co = Get.put(OrderController());
  // final con = Get.put(ProfileController());
  // final conn = Get.put(HomeController());
  // final coreController = Get.put(CoreController());
  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(),
      const OrderScreen(),
       ProfileScreen(),
    ];
    return Scaffold(
      // appBar:
      body: Obx(() => pages[c.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavyBar(
            selectedIndex: c.currentIndex.value,
            onItemSelected: c.onItemTapped,
            items: [
              BottomNavyBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text("Home"),
                  textAlign: TextAlign.center,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: Colors.grey),
              BottomNavyBarItem(
                  icon: const Icon(Icons.bookmark),
                  title: const Text("Orders"),
                  textAlign: TextAlign.center,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: Colors.grey),
              BottomNavyBarItem(
                icon: const Icon(Icons.person),
                title: const Text("Profile"),
                textAlign: TextAlign.center,
                activeColor: AppColors.primaryColor,
                inactiveColor: Colors.grey,
              ),
            ]),
      ),
    );
  }
}
