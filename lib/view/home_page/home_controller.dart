
import 'package:ecommerce/data/db/sqlite_manager.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/remote_sevices.dart';
import 'package:ecommerce/utils/api_endPoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {


  TextEditingController searchController = TextEditingController();
  RxList<ProductModel> rxJewelery = RxList.empty();
  List<ProductModel> get jeweleryList => rxJewelery.toList();
  RxList<ProductModel> rxElectronics = RxList.empty();
  List<ProductModel> get electronicsList => rxElectronics.toList();
  RxList<ProductModel> rxWomenCloth = RxList.empty();
  List<ProductModel> get womenClothList => rxWomenCloth.toList();
  RxList<ProductModel> rxMenCloth = RxList.empty();
  List<ProductModel> get menClothList => rxMenCloth.toList();


  void getAllJewelery()async{
    List<ProductModel> listOfJewelery = await RemoteServices.getAllList(ApiEndPoint.ALL_PRODUCT_JEWELERY);
    rxJewelery.assignAll(listOfJewelery);
  }

  void getAllElectronics()async{
    List<ProductModel> listOfElectronics = await RemoteServices.getAllCategoriesElectronicsList();
    rxElectronics.assignAll(listOfElectronics);
  }

  void getAllWomenCloth()async{
    List<ProductModel> listOfWomenCloth = await RemoteServices.getAllCategoriesWomenClothList();
    rxWomenCloth.assignAll(listOfWomenCloth);
  }
  void getAllMenCloth()async{
    List<ProductModel> listOfMenCloth = await RemoteServices.getAllCategoriesMenClothList();
    rxMenCloth.assignAll(listOfMenCloth);

  }
  @override
  void onInit() {
    super.onInit();
    getAllJewelery();
    getAllElectronics();
    getAllWomenCloth();
    getAllMenCloth();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }


}
