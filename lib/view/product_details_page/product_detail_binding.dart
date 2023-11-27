import 'package:ecommerce/view/product_details_page/product_detail_controller.dart';
import 'package:get/get.dart';


class ProductDetailBinding  extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(
            () => ProductDetailController()
    );
  }
}