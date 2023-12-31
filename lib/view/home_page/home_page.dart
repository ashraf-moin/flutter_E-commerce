import 'package:ecommerce/main.dart';
import 'package:ecommerce/route/app_routes.dart';
import 'package:ecommerce/utils/app_images.dart';
import 'package:ecommerce/view/home_page/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});





  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: myAppBar(),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                width: deviceWidth,
                height: 50,
                color: Appcolors.c2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Jewelery",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Appcolors.c3),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.ALLPRODUCT);
                      },
                      icon: const Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.jeweleryList.length,
                itemBuilder: (context, index) {
                  return buildCard(index);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                width: deviceWidth,
                height: 50,
                color: Appcolors.c2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Electronics",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Appcolors.c3),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.ALLPRODUCT);
                      },
                      icon: const Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.electronicsList.length,
                itemBuilder: (context, index) {
                  return buildCard01(index);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                width: deviceWidth,
                height: 50,
                color: Appcolors.c2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Women's clothing",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Appcolors.c3),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.ALLPRODUCT);
                      },
                      icon: const Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.womenClothList.length,
                itemBuilder: (context, index) {
                  return buildCard02(index);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                width: deviceWidth,
                height: 50,
                color: Appcolors.c2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Men's clothing",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Appcolors.c3),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.ALLPRODUCT);
                      },
                      icon: const Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.menClothList.length,
                itemBuilder: (context, index) {
                  return buildCard03(index);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(int index) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.PRODUCTDRETAILS,
          arguments: controller.jeweleryList[index],
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Stack(
          children: [
            SizedBox(
              height: 200,
              child: controller.jeweleryList[index].image == "null"
                  ? Image.asset(AppImage.NO_IMAGE, fit: BoxFit.cover)
                  : Image.network(controller.jeweleryList[index].image!),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black.withOpacity(0.60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.jeweleryList[index].title ?? "No Name",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Appcolors.c3,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "USD ${controller.jeweleryList[index].price}" ??
                              "0.00",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Appcolors.c3),
                        ),
                        IconButton(
                          onPressed: () {
                            print(controller.jeweleryList[index].price);
                          },
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard01(int index) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.PRODUCTDRETAILS,
          arguments: controller.electronicsList[index],
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Stack(
          children: [
            SizedBox(
              height: 200,
              child: controller.electronicsList[index].image == "null"
                  ? Image.asset(AppImage.NO_IMAGE, fit: BoxFit.cover)
                  : Image.network(controller.electronicsList[index].image!),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black.withOpacity(0.60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.electronicsList[index].title ?? "No Name",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Appcolors.c3,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "USD ${controller.electronicsList[index].price}" ??
                              "0.00",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Appcolors.c3),
                        ),
                        IconButton(
                          onPressed: () {
                            print(controller.electronicsList[index].price);
                          },
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard02(int index) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.PRODUCTDRETAILS,
          arguments: controller.womenClothList[index],
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Stack(
          children: [
            SizedBox(
              height: 200,
              child: controller.womenClothList[index].image == "null"
                  ? Image.asset(AppImage.NO_IMAGE, fit: BoxFit.cover)
                  : Image.network(controller.womenClothList[index].image!),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black.withOpacity(0.60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.womenClothList[index].title ?? "No Name",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Appcolors.c3,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "USD ${controller.womenClothList[index].price}" ??
                              "0.00",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Appcolors.c3),
                        ),
                        IconButton(
                          onPressed: () {
                            print(controller.womenClothList[index].price);
                          },
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard03(int index) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.PRODUCTDRETAILS,
          arguments: controller.menClothList[index],
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Stack(
          children: [
            SizedBox(
              height: 200,
              child: controller.menClothList[index].image == "null"
                  ? Image.asset(AppImage.NO_IMAGE, fit: BoxFit.cover)
                  : Image.network(controller.menClothList[index].image!),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black.withOpacity(0.60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.menClothList[index].title ?? "No Name",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Appcolors.c3,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "USD ${controller.menClothList[index].price}" ??
                              "0.00",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Appcolors.c3),
                        ),
                        IconButton(
                          onPressed: () {
                            print(controller.menClothList[index].price);
                          },
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard04(int index) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.PRODUCTDRETAILS,
          arguments: controller.womenClothList[index],
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Stack(
          children: [
            SizedBox(
              height: 200,
              child: controller.womenClothList[index].image == "null"
                  ? Image.asset(AppImage.NO_IMAGE, fit: BoxFit.cover)
                  : Image.network(controller.womenClothList[index].image!),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black.withOpacity(0.60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.womenClothList[index].title ?? "No Name",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Appcolors.c3,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "USD ${controller.womenClothList[index].price}" ??
                              "0.00",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Appcolors.c3),
                        ),
                        IconButton(
                          onPressed: () {
                            print(controller.womenClothList[index].price);
                          },
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: const Text('Home page', style: TextStyle(color: Colors.white)),
      backgroundColor: Appcolors.c1,
      actions: [
        IconButton(
            onPressed: () {
              Get.toNamed(
                AppRoutes.CART,
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Appcolors.c3,
            ))
      ],
    );
  }





}
