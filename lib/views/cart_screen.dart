import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meal_mentor/utils/colors.dart';

import '../utils/image_paths.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String dropdownvalue = 'Table';

  // List of items in our dropdown menu
  var items = [
    'Table 1',
    'Table 2',
    'Table 3',
    'Table 4',
    'Table 5',
  ];

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
      body: Column(
        children: [
          CategoryCard(
            name: "Burger",
            textTheme: textTheme,
          )
        ],
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
              Container(
                margin: const EdgeInsets.only(left: 20),
                width: (Get.width / 2.5),
                height: 50,
                decoration: const BoxDecoration(
                    // color: Colors.greenAccent, //<-- SEE HERE
                    ),
                child: DropdownButton(
                  // Initial Value
                  value: dropdownvalue,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
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
  const CategoryCard({
    super.key,
    required this.textTheme,
    required this.name,
  });

  final TextTheme textTheme;
  final String name;
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
                  Text(
                    name,
                    style: textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
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
                  const Text("1"),
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
                onPressed: () {},
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
