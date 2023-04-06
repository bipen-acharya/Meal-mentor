import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meal_mentor/views/order/past_order_screen.dart';
import 'package:meal_mentor/views/order/running_order_screen.dart';

import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../cart_screen.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order_screen';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.extraWhiteLight,
        elevation: 5,
        shadowColor: AppColors.shadowColor,
        title: const Image(
          image: AssetImage(
            ImagesPath.logo,
          ),
          height: 40,
          width: 50,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: IconButton(
              icon: SvgPicture.asset(IconPath.cart),
              onPressed: () {
                Get.to(() => CartScreen());
              },
            ),
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              constraints:
                  const BoxConstraints(maxHeight: 150.0, minHeight: 50),
              // ignore: prefer_const_constructors
              child: Material(
                color: AppColors.extraWhiteLight,
                child: const TabBar(
                  indicatorColor: AppColors.primaryColor,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'Remaining Orders'),
                    Tab(text: 'Past Orders'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  RunningOrder(),
                  PastOrderScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
