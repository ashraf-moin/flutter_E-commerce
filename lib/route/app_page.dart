import 'package:ecommerce/route/app_routes.dart';
import 'package:ecommerce/view/all_product_page/all_product_page.dart';
import 'package:ecommerce/view/all_product_page/all_product_page_binding.dart';
import 'package:ecommerce/view/cart_page/cart_binding.dart';
import 'package:ecommerce/view/cart_page/cart_page.dart';
import 'package:ecommerce/view/home_page/home_page.dart';
import 'package:ecommerce/view/home_page/home_binding.dart';
import 'package:ecommerce/view/login_page/loginbinding.dart';
import 'package:ecommerce/view/login_page/login_page.dart';
import 'package:ecommerce/view/product_details_page/product_detail.dart';
import 'package:ecommerce/view/product_details_page/product_detail_binding.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.ALLPRODUCT,
        page: () => const AllProductPage(),
        binding: AllProductPageBinding()),
    GetPage(
        name: AppRoutes.PRODUCTDRETAILS,
        page: () => const ProductDetailsPage(),
        binding: ProductDetailBinding()),
    GetPage(
        name: AppRoutes.CART,
        page: () => const CartPage(),
        binding: CartBinding()),
  ];
}
