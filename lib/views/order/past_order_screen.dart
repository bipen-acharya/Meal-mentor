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

      body: ListView.builder(
          itemCount: c.pastOrders.length,
          itemBuilder: (context, index) {
            PastOrder pastOrder = c.pastOrders[index];
            return ExpandablePanel(
              header: ListTile(
                title: Text(pastOrder.table!.name ?? ""),
              ),
              expanded: ListView.builder(
                shrinkWrap: true,
                itemCount: pastOrder.orderableItems!.length,
                itemBuilder: (context, index) {
                  PastOrderOrderableItems orderItem =
                      pastOrder.orderableItems![index];
                  return ListTile(
                    leading: Text(orderItem.price ?? ""),
                  );
                },
              ),
              collapsed: Container(),
            );
          }),
    );
  }
}
