import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meal_mentor/utils/colors.dart';

import '../../controller/home_screen_controller.dart';
import '../../utils/image_paths.dart';
import '../cart_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  HomeScreen({super.key});

  final c = Get.find<HomeController>();
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
                Get.to(() => const CartScreen());
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 23),
                child: Text(
                  "Category",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 51,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    final colors = [
                      const Color(0xffFBF5EB),
                      const Color(0xFFF4F8FC),
                      const Color(0xffFDEEF4),
                      const Color(0xffF7F7F5),
                    ];
                    final colorIndex = index % colors.length;
                    if (index == 0) {
                      return const SizedBox(
                        width: 23,
                      );
                    }
                    return Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: 2, right: 2),
                      decoration: BoxDecoration(
                        color: colors[colorIndex],
                        shape: BoxShape.rectangle,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 9),
                      child: Row(
                        children: [
                          Image.network(
                            'https://freepngimg.com/thumb/food/4-2-food-png.png',
                            fit: BoxFit.fill,
                            height: 46,
                            width: 31,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Burger don",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              // color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 23),
                child: Text(
                  "All Items",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                // height: Get.height / 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: GridView.builder(
                    physics: ScrollPhysics(), // to disable GridView's scrolling
                    shrinkWrap: true,
                    itemCount: 17,
                    // physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 169,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return const AllItemCard();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopMenu extends StatelessWidget {
  const TopMenu({
    super.key,
    required this.url,
    required this.name,
    required this.color,
  });
  final String url;
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.only(left: 2, right: 2),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
            child: Row(
              children: [
                Image.network(
                  url,
                  fit: BoxFit.fill,
                  height: 46,
                  width: 31,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomCard extends StatelessWidget {
  const BottomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 23, bottom: 15),
      height: 160,
      width: Get.width / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 9,
            color: const Color(0xFF494949).withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
              width: double.infinity,
              // color: Colors.amber,
              height: 110,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  "https://images.news18.com/ibnlive/uploads/2022/05/tea-traditions.jpg",
                  fit: BoxFit.fill,
                ),
              )
              // Image.asset(
              //   VehiclesImages.carSample1,
              //   fit: BoxFit.fill,
              // ),
              ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Column(
                  children: const [
                    Text(
                      "Burger",
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Rs 500",
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 35,
                  width: 35,
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
          )
        ],
      ),
    );
  }
}

class AllItemCard extends StatelessWidget {
  const AllItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 160,
      width: Get.width / 2.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 9,
            color: const Color(0xFF494949).withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
              width: double.infinity,
              // color: Colors.amber,
              height: 110,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  "https://images.news18.com/ibnlive/uploads/2022/05/tea-traditions.jpg",
                  fit: BoxFit.fill,
                ),
              )
              // Image.asset(
              //   VehiclesImages.carSample1,
              //   fit: BoxFit.fill,
              // ),
              ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Column(
                  children: const [
                    Text(
                      "Burger",
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Rs 500",
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 35,
                  width: 35,
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
          )
        ],
      ),
    );
  }
}
