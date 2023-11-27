import 'package:ecommerce/route/app_routes.dart';
import 'package:ecommerce/view/widgets/search_bar.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/utils/app_images.dart';
import 'package:ecommerce/view/all_product_page/all_product_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductPage extends GetView<AllProductController> {
  const AllProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: myAppBar(),


      body: SafeArea(
        child: Obx(() =>
            Column(
              children: [
                MySearchBar(controller: controller.searchcontroller),
                const SizedBox(height: 8),

                Expanded(
                  child: GridView.builder(

                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      return buildCard(index);
                    }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
      onTap: () {
        Get.toNamed(
          AppRoutes.PRODUCTDRETAILS,
          arguments: controller.productList[index],
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Stack(
          children: [
            SizedBox(
              height: 200,
              child: controller.productList[index].image == "null"
                  ? Image.asset(AppImage.NO_IMAGE,
                  fit: BoxFit.cover)
                  : Image.network(controller.productList[index].image!),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.black.withOpacity(0.60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(controller.productList[index].title ?? "No Name",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 12, color: Appcolors.c3,),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("USD ${controller.productList[index].price}" ??
                            "0.00",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight
                              .bold, color: Appcolors.c3),),
                        IconButton(onPressed: () {
                          print(
                              controller.productList[index].price);
                        },
                          icon: Icon(
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


  AppBar myAppBar() {
    return AppBar(
      title: Text('All Product Page', style: TextStyle(color: Colors.white)),
      backgroundColor: Appcolors.c1,
      actions: [
        IconButton(onPressed: () {

        },
            icon: Icon(Icons.shopping_cart, color: Appcolors.c3,))
      ],
    );
  }

}



