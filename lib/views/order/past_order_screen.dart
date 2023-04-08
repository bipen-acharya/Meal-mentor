import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_mentor/controller/order_controller.dart';
import 'package:meal_mentor/models/past_order.dart';

class PastOrderScreen extends StatelessWidget {
  PastOrderScreen({super.key});

  final c = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Obx(
      //   () => Column(
      //     children: [
      //       Container(
      //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      //         margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(10),
      //           boxShadow: [
      //             BoxShadow(
      //               color: const Color(0xFF828282).withOpacity(0.2),
      //               blurRadius: 9,
      //               offset: const Offset(4, 4),
      //             )
      //           ],
      //         ),
      //         child:

      //       ),
      //     ],
      //   ),
      // ),

      body: Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: Get.height - 275,
                    child: ListView.builder(
                        itemCount: c.pastOrderList.length,
                        itemBuilder: (context, index) {
                          PastOrder pastOrder = c.pastOrderList[index];
                          return ExpandablePanel(
                            header: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(pastOrder.table!.name ?? ""),
                                Text(pastOrder.totalAmount.toString()),
                              ],
                            ),
                            expanded: ListView.builder(
                              shrinkWrap: true,
                              itemCount: pastOrder.orderableItems!.length,
                              itemBuilder: (context, index) {
                                PastOrderOrderableItems orderItem =
                                    pastOrder.orderableItems![index];
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(orderItem.itemName!.name ?? ""),
                                    Text(orderItem.price ?? ""),
                                  ],
                                );
                              },
                            ),
                            collapsed: Container(),
                          );
                        }),
                  ),
                ],
              ),
      ),
    );
  }
}
