import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_mentor/controller/order_controller.dart';
import 'package:meal_mentor/models/past_order.dart';

import '../../utils/colors.dart';

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
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: SizedBox(
                      height: Get.height - 275,
                      child: ListView.builder(
                          itemCount: c.pastOrderList.length,
                          itemBuilder: (context, index) {
                            PastOrder pastOrder = c.pastOrderList[index];
                            return ExpandablePanel(
                              theme: const ExpandableThemeData(
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                tapBodyToCollapse: true,
                              ),
                              header: ListTile(
                                title: Text(pastOrder.table!.name ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                trailing: Text(pastOrder.totalAmount.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: AppColors.secondaryColor)),
                              ),
                              expanded: ListView.builder(
                                shrinkWrap: true,
                                itemCount: pastOrder.orderableItems!.length,
                                itemBuilder: (context, index) {
                                  PastOrderOrderableItems orderItem =
                                      pastOrder.orderableItems![index];
                                  return ListTile(
                                    title: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text("Item: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color:
                                                    AppColors.secondaryColor)),
                                        Text(
                                          orderItem.itemName!.name ?? "",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            const Text('Cost: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13,
                                                    color: AppColors
                                                        .secondaryColor)),
                                            Text(orderItem.price ?? "",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              collapsed: Container(),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
