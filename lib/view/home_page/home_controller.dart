
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/remote_sevices.dart';
import 'package:ecommerce/utils/api_endPoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  var  valueAS = 'abcd'.obs;
  TextEditingController searchController = TextEditingController();
  RxList<ProductModel> rxJewelery = RxList.empty();
  List<ProductModel> get jeweleryList => rxJewelery.toList();
  RxList<ProductModel> rxElectronics = RxList.empty();
  List<ProductModel> get electronicsList => rxElectronics.toList();



  void getAllJewelery()async{
    List<ProductModel> listOfJewelery = await RemoteServices.getAllList(ApiEndPoint.ALL_PRODUCT_JEWELERY);
    rxJewelery.assignAll(listOfJewelery);
  }

  void getAllElectronics()async{
    List<ProductModel> listOfElectronics = await RemoteServices.getAllCategoriesElectronicsList();
    rxElectronics.assignAll(listOfElectronics);
  }



  @override
  void onInit() {
    super.onInit();
    getAllJewelery();
    getAllElectronics();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }


}
