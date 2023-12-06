import 'package:ecommerce/view/cart_page/cart_controller.dart';
import 'package:ecommerce/view/product_details_page/product_detail_controller.dart';
import 'package:get/get.dart';


class CartBinding  extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CartController>(
            () => CartController());
  }
}