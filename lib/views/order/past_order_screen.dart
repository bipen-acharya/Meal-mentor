import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_mentor/controller/order_controller.dart';

class PastOrderScreen extends StatelessWidget {
  PastOrderScreen({super.key});

  final c = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF828282).withOpacity(0.2),
                    blurRadius: 9,
                    offset: const Offset(4, 4),
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Order 1",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "Table 1",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Rs 400",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                            onPressed: () {
                              c.pastDetails.value = !c.pastDetails.value;
                            },
                            icon: Icon(c.pastDetails.value
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Visibility(
                      visible: c.pastDetails.value,
                      child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Item: Burger",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        "Cost : 240 ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 23,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
