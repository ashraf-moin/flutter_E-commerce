import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/remote_sevices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController{
  TextEditingController searchController = TextEditingController();
  RxList<ProductModel> rxProductList = RxList.empty();
  List<ProductModel> get productList => rxProductList.toList();

  void getAllProduct()async{
    List<ProductModel> listOfProduct = await RemoteServices.getAllProductList();
    rxProductList.addAll(listOfProduct);
  //   test
  print("-----------");
  print(listOfProduct.length);
  }

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllProduct();
  }


}