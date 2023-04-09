import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meal_mentor/controller/cart_controller.dart';
import 'package:meal_mentor/models/meal_mentor_item.dart';
import 'package:meal_mentor/utils/colors.dart';

import '../models/meal_mentor_table.dart';
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
        body: Obx(
          () => SizedBox(
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
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Obx(() {
            if (c.allTableList.isEmpty) {
              return const SizedBox();
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: DropdownButtonFormField<MealMentorTable>(
                    decoration: const InputDecoration(
                      // labelText: 'Select a table',
                      border: OutlineInputBorder(),
                    ),
                    value: c.allTableList.first,
                    items: c.allTableList
                        .map((table) => DropdownMenuItem(
                              value: table,
                              child: Text(table.name!),
                            ))
                        .toList(),
                    onChanged: (selectedTable) {
                      c.setSelectedTable(selectedTable!);
                    },
                  ),
                ),
                // Send Order button
                SizedBox(
                  height: 63,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      final selectedTable = c.allTableList.firstWhere(
                          (table) => table == c.selectedTable.value,
                          orElse: () => c.allTableList.first);
                      final selectedTableId =
                          c.allTableList.indexOf(selectedTable);
                      print(
                          'Selected table ID: $selectedTableId, Name: ${selectedTable.name}');

                      int total = 0;
                      for (MealMentorItem item in c.cartItem) {
                        total += item.itemCount * int.parse(item.price!);
                      }
                      print('Total cart value: $total');
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('AlertDialog Title'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Total:$total '),
                              Text(
                                  'Tavle id:$selectedTableId name ${selectedTable.name}'),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text("Send Order"),
                  ),
                ),
              ],
            );
          }),
        ));
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
                    '${mmItems.itemCount} x ${mmItems.price}',
                    style: textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${((mmItems.itemCount) * (int.parse(mmItems.price!)))}',
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
                    onTap: () {
                      c.incrementItemQuantity(mmItems);
                    },
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
                    onTap: () {
                      c.decrementItemQuantity(mmItems);
                    },
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
                          Icons.remove,
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
                  c.removeItem(mmItems);
                  // totalValue += ((mmItems.itemCount) * (int.parse(mmItems.price!)));
                  // log("----------lenghth of cart ${c.cartItem.length}-------");
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
