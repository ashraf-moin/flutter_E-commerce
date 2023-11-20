
import 'package:ecommerce/main.dart';
import 'package:ecommerce/view/login_page/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Appcolors.c1,
      body: SafeArea(
          child: Container(

            child: Text('Login Page'),
          )
      ),
    );
  }


}
