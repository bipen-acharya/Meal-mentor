import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_mentor/controller/order_controller.dart';

class RunningOrder extends StatelessWidget {
  RunningOrder({super.key});

  final c = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Center(
              child: Container(
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
                                c.showDetails.value = !c.showDetails.value;
                              },
                              icon: Icon(c.showDetails.value
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Visibility(
                        visible: c.showDetails.value,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
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
            ),
          ],
        ),
      ),
    );
  }
}

// class MyWidget extends StatefulWidget {
//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   List<Item> _items = [
//     Item(name: "Table 1", item: "Item 1", quantity: 3),
//     Item(name: "Table 2", item: "Item 2", quantity: 2),
//     Item(name: "Table 3", item: "Item 3", quantity: 5),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 7,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: ExpansionPanelList(
//         expansionCallback: (int index, bool isExpanded) {
//           setState(() {
//             _items[index].isExpanded = !isExpanded;
//           });
//         },
//         children: _items.map((Item item) {
//           return ExpansionPanel(
//             headerBuilder: (BuildContext context, bool isExpanded) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     item.name,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   Icon(
//                     isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
//                   ),
//                 ],
//               );
//             },
//             body: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Item: ${item.item}"),
//                 Text("Quantity: ${item.quantity}"),
//               ],
//             ),
//             isExpanded: item.isExpanded,
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// class Item {
//   final String name;
//   final String item;
//   final int quantity;
//   bool isExpanded;

//   Item({
//     required this.name,
//     required this.item,
//     required this.quantity,
//     this.isExpanded = false,
//   });
// }
