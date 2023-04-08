import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meal_mentor/controller/cart_controller.dart';
import 'package:meal_mentor/models/meal_mentor_item.dart';
import 'package:meal_mentor/utils/colors.dart';

import '../utils/image_paths.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  CartScreen({super.key});

  final c = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.extraWhiteLight,
        elevation: 5,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
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
            child: SvgPicture.asset(IconPath.cart),
          )
        ],
      ),
      body: SizedBox(
        child: ListView.builder(
            itemCount: c.cartItem.length,
            itemBuilder: (context, index) {
              MealMentorItem mealMentorItem = c.cartItem[index];
              return CategoryCard(
                textTheme: textTheme,
                mmItems: mealMentorItem,
              );
            }),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: (Size(Get.width / 2.5, 50))),
                onPressed: () {},
                child: const Text("Order"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard({
    super.key,
    required this.textTheme,
    required this.mmItems,
  });

  final TextTheme textTheme;

  final MealMentorItem mmItems;
  final c = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF828282).withOpacity(0.3),
            blurRadius: 9,
            offset: const Offset(4, 4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 70,
                width: 83,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: const Image(
                    image: NetworkImage('https://picsum.photos/300/300'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width / 3,
                    child: Text(
                      mmItems.name ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: false,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    '1 x 120.00',
                    style: textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '120.00',
                    style: textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 7, left: 7),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text(mmItems.itemCount.toString()),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 7, left: 7),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // minimumSize: Size(10, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // c.cartItem.remove()
                  log("----------lenghth of cart ${c.cartItem.length}-------");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 11.5,
                    horizontal: 18,
                  ),
                  child: Text(
                    'Remove',
                    style: textTheme.bodyLarge!.copyWith(
                        fontSize: 12, color: AppColors.extraWhiteLight),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
