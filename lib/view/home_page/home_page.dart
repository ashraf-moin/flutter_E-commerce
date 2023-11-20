import 'package:ecommerce/main.dart';
import 'package:ecommerce/view/home_page/Home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Appcolors.c1,
      ),
      body:  Center(
        child: Text(
          'Welcome to the Main Page!',
          style: TextStyle(color: Appcolors.c3),
        ),
      ),
    );
  }
}
