import 'package:ecommerce/model/product_model.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController{

  ProductModel args = Get.arguments;
  var productQuantity = 1.obs;
  void increment() {
    productQuantity.value++;
  }

  void decrement() {
    if (productQuantity.value > 1) {
      productQuantity.value--;
    }
  }









}