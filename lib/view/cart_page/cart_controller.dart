
import 'dart:ffi';

import 'package:ecommerce/data/db/sqlite_manager.dart';
import 'package:ecommerce/data/db/sqlite_table.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class CartController extends GetxController{

  RxList<ProductModel> rxCartList =RxList.empty();
  final RxDouble finalTotalPrice = 0.0.obs;
  final SQliteManager dbManager = Get.find(tag: (SQliteManager).toString());
  void getCardList(){
    dbManager.getAllCartProduct().then((value){
      rxCartList.assignAll(value);
    });
  }


  @override
  void onInit(){
    super.onInit();
    getCardList();

  }

double totalPrice(int index){
    int qn = rxCartList.value[index].quantity!;
    double price = rxCartList.value[index].price!;
    var total = price * qn;

    return total;
}  // Method to calculate total price for all items in the cart
  double totalCartPrice() {
    double totalPrice = 0.0;
    for (var cartItem in rxCartList) {
      totalPrice += cartItem.price! * cartItem.quantity!;
    }
    return totalPrice;
  }

 void checkOut(){
    dbManager.deleteAllItem(tableProduct);
    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(content: Text('CheckOut complete'),backgroundColor: Appcolors.c2,));
    Get.back();

    
}
void deleteItem(int id){
    dbManager.deleteProductById(id).then((value) => {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(content: Text('Delete Item'),backgroundColor: Colors.red,))
    });
}



}

