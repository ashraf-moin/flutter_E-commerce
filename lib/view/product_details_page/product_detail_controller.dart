import 'dart:ffi';

import 'package:ecommerce/data/db/sqlite_manager.dart';
import 'package:ecommerce/data/db/sqlite_table.dart';
import 'package:ecommerce/main.dart';

import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  ProductModel args = Get.arguments;
  var productQuantity = 1.obs;
  var selectedProduct = ProductModel().obs;
  final SQliteManager dbManager = Get.find(tag: (SQliteManager).toString());

  void increment() {
    productQuantity.value++;
  }

  void decrement() {
    if (productQuantity.value > 1) {
      productQuantity.value--;
    }
  }

  void selectedAddTOCart(BuildContext context) {
    selectedProduct.value = args;
    selectedProduct.value.quantity = productQuantity.value;
    dbManager.insertItem(tableProduct, selectedProduct.value.toJson()).then((value){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Successfuly add to cart!!'),backgroundColor:
      Appcolors.c2));
      Get.back();
    });
  }

}








