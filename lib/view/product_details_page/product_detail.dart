import 'package:ecommerce/main.dart';
import 'package:ecommerce/utils/app_images.dart';
import 'package:ecommerce/view/product_details_page/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends GetView<ProductDetailController> {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Appcolors.c3,
      appBar: myAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    height: size.height * 0.3,
                    width: size.width,
                    child: controller.args.image == "null"
                        ? Image.asset(AppImage.NO_IMAGE, fit: BoxFit.cover)
                        : Image.network(controller.args.image!),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Appcolors.c2,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 12),
                          Text(
                            '${controller.args.rating!.rate ?? 0.00}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: size.width,
                color: Appcolors.c2,
                child: Text(
                  (controller.args.category ?? "NO NAME").toUpperCase(),
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                controller.args.title ?? "NO NAME",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                controller.args.description ?? "NO NAME",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'USD ${controller.args.price ?? 0.00}',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: Text('Details', style: TextStyle(color: Colors.white)),
      backgroundColor: Appcolors.c1,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_shopping_cart_outlined,
              color: Appcolors.c3,
            ))
      ],
    );
  }
}
