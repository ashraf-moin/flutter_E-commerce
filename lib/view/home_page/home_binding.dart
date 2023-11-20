import 'package:ecommerce/view/home_page/home_controller.dart';
import 'package:get/get.dart';


class HomeBinding  extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
            () => HomeController()
    );
  }
}