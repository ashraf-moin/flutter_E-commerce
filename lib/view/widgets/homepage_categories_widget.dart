//  import 'package:ecommerce/main.dart';
// import 'package:ecommerce/utils/app_images.dart';
// import 'package:ecommerce/view/home_page/Home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CategoriesWidget extends GetView<HomeController>{
//   @override
//   Widget build(BuildContext context){
//     return SingleChildScrollView(
//        scrollDirection : Axis.horizontal,
//       child: Row(
//         children: [
//           Container(
//             padding: EdgeInsets.all(8),
//             margin: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Appcolors.c3,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                       child: controller.productList[index].image == "null"
//                           ? Image.asset(AppImage.NO_IMAGE,
//                           fit: BoxFit.cover)
//                           : Image.network(controller.productList[index].image!),
//
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//
//
//     );
//   }
// }