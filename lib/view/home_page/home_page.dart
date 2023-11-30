
import 'package:ecommerce/main.dart';
import 'package:ecommerce/route/app_routes.dart';
import 'package:ecommerce/utils/app_images.dart';
import 'package:ecommerce/view/home_page/home_controller.dart';
import 'package:ecommerce/view/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: myAppBar(),
      body: SafeArea(
        child: Obx(() =>
            Column(
              children: [
                Text(controller.valueAS.value),
                MySearchBar(controller: controller.searchController),
                const SizedBox(height: 8),
                Expanded(
                  child: GridView.builder(
                    itemCount: controller.jeweleryList.length,
                    itemBuilder: (context, index) {
                      return buildCard(index);
                    }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of items in each row
                    mainAxisSpacing: 8.0, // spacing between rows
                    crossAxisSpacing: 8.0, // spacing between columns
                  ),
                  ),
                )
              ],

            ),
        ),
      ),


    );
  }

  Widget buildCard(int index) {
    return InkWell(
      onTap: () {Get.toNamed(AppRoutes.PRODUCTDRETAILS, arguments: controller.jeweleryList[index],);},
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Stack(
          children: [
            SizedBox(
              height: 200,
              child: controller.jeweleryList[index].image == "null"
                  ? Image.asset(AppImage.NO_IMAGE,
                  fit: BoxFit.cover)
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

                    Text(controller.jeweleryList[index].title ?? "No Name",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 12, color: Appcolors.c3,),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("USD ${controller.jeweleryList[index].price}" ??
                            "0.00",
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight
                              .bold, color: Appcolors.c3),),
                        IconButton(onPressed: () {
                          print(
                              controller.jeweleryList[index].price);
                        },
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined, color: Colors.green,),),
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



      // body:SafeArea(
      //   child: Obx(() =>
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: Column(
      //           children: [
      //             const SizedBox(height: 16.0),
      //             Text('Categories', style: TextStyle(fontSize: 24.0)),
      //             const SizedBox(height: 16.0),
      //
      //             Expanded(
      //               child: GridView.count(
      //                 crossAxisCount: 2,
      //                 mainAxisSpacing: 16.0,
      //                 crossAxisSpacing: 16.0,
      //
      //               ),
      //             ),
      //             const SizedBox(height: 32.0),
      //             Text('Featured Products', style: TextStyle(fontSize: 24.0)),
      //             const SizedBox(height: 16.0),
      //             Expanded(
      //               child: GridView.count(
      //                 crossAxisCount: 2,
      //                 mainAxisSpacing: 16.0,
      //                 crossAxisSpacing: 16.0,
      //
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //
      //
      //
      //   ),
      // ),

  //
  //   );
  // }
  //


  AppBar myAppBar() {
    return AppBar(
      title: const Text('Home page', style: TextStyle(color: Colors.white)),
      backgroundColor: Appcolors.c1,
      actions: [
        IconButton(onPressed: () {
          Get.toNamed(
            AppRoutes.ALLPRODUCT,
          );
        },
            icon: const Icon(Icons.shopping_cart, color: Appcolors.c3,))
      ],
    );
  }
}





