
import 'package:ecommerce/view/all_product_page/all_product_page_controller.dart';
import 'package:get/get.dart';


class AllProductPageBinding  extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AllProductController>(
            () => AllProductController()
    );
  }
}