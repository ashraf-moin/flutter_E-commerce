

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
        child: Obx(() => Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
                child: TextField(
                decoration: InputDecoration(
                  labelText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                  contentPadding: EdgeInsets.only(left: 16,right: 16),
                  suffixIcon: Icon(Icons.search_rounded),
                ),
                ),
      ),

            Expanded(
              child: GridView.builder(

                itemCount: controller.productList.length,
                itemBuilder:  (context,index){
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
    return Card(



                  clipBehavior: Clip.antiAlias,
                  elevation: 4,
                  child: Stack(

                    children: [

                      SizedBox(


                        height: 200,
                        child: controller.productList[index].image =="null"
                            ? Image.asset(AppImage.NO_IMAGE,
                            height: 45,
                            width: 45,
                            fit: BoxFit.fitHeight)
                            : Image.network(controller.productList[index].image!),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 80,
                          color: Colors.black.withOpacity(0.60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              Text(controller.productList[index].title ?? "No Name",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style:TextStyle(fontSize: 12 , color: Appcolors.c3,),),
                              Text("USD ${controller.productList[index].price}"??"0.00",style:TextStyle(fontSize: 14 ,fontWeight: FontWeight.bold, color: Appcolors.c3),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
  }


  AppBar myAppBar(){
    return  AppBar(
      title: Text('All Product Page',style: TextStyle(color: Colors.white)),
      backgroundColor: Appcolors.c1,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart_outlined,color: Appcolors.c3,))
      ],
    );
  }

}

