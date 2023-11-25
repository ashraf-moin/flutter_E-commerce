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
      appBar: AppBar(
        title: Text('All Product Page',style: TextStyle(color: Colors.white)),
        backgroundColor: Appcolors.c1,



      ),


      body: SafeArea(
        child: Obx(() => GridView.builder(
          
          itemCount: controller.productList.length,
          itemBuilder:  (context,index){
          return Card(
            clipBehavior: Clip.antiAlias,
             elevation: 4,
             child: Stack(
               children: [
                 SizedBox(
                   height: 200,
                   child: controller.productList[index].image =="null"
                       ? Image.asset(AppImage.NO_IMAGE)
                       : Image.network(controller.productList[index].image!),
                 ),
                 Positioned(
                   bottom: 0,
                   left: 0,
                   right: 0,
                   child: Container(
                      height: 80,
                     color: Colors.black.withOpacity(0.60),
                     child: Column(
                       children: [
                         Text(controller.productList[index].title ?? "No Name",style:TextStyle(fontSize: 12 , color: Appcolors.c3),),
                         Text("${controller.productList[index].price}"??"0.00",style:TextStyle(fontSize: 14 , color: Appcolors.c3),),
                       ],
                     ),
                   ),
                 )
               ],
             ),
             );
           }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0, // spacing between columns
        ),

        ),
        ),
        ),











    );
  }
}
