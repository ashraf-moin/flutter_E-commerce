import 'package:ecommerce/route/app_routes.dart';
import 'package:ecommerce/view/home_page/home_page.dart';
import 'package:ecommerce/view/home_page/home_binding.dart';
import 'package:ecommerce/view/login_page/loginbinding.dart';
import 'package:ecommerce/view/login_page/login_page.dart';

import 'package:get/get.dart';






class AppPages{

  AppPages._();


  static final pages = [
    GetPage(
  name: AppRoutes.LOGIN,
  page: () => const LoginPage(),
  binding: LoginBinding()
    ),

  GetPage(
  name: AppRoutes.HOME,
  page: () => const HomePage(),
  binding: HomeBinding()
  ),


  ];


}