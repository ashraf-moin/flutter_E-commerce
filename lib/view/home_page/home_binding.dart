import 'package:ecommerce/view/home_page/Home_controller.dart';
import 'package:get/get.dart';

class Homebinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController> (() => HomeController()
    );
  }

}