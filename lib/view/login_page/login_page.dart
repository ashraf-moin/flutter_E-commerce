import 'package:ecommerce/main.dart';
import 'package:ecommerce/route/app_routes.dart';
import 'package:ecommerce/view/login_page/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => Stack(
              children: [
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Text('LOG IN -Ecommerce',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center),
                ),
                Positioned(
                  top: 180,
                  left: 16,
                  right: 16,
                  child: Column(
                    children: [
                      TextField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'example@gmail.com',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: controller.passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),
                      Text(controller.isSaved.value),
                      // SizedBox(height: 32,),
                      // Text(controller.email.value),
                      // Text(controller.password.value),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 80,
                    left: 16,
                    right: 16,
                    child: ElevatedButton(
                        onPressed: () {

                          Get.offAllNamed(AppRoutes.HOME);
                          controller
                              .setLoginInfo(controller.emailController.text,
                                  controller.passwordController.text)
                              .then((value) {
                            controller.emailController.clear();
                            controller.passwordController.clear();
                            controller.isSaved.value = 'Log In Successfully';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.c1, // background
                          // foreground
                        ),
                        child: Text('Log In'))),

                // This section is for show Data to see the email and password by SharedPreferences
                // Positioned(
                //     bottom: 30,left: 16,right: 16,
                //     child:
                //
                //     ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: Appcolors.c1, // background
                //           // foreground
                //         ),
                //         onPressed: (){
                //
                //       controller.getLoginInfo();
                //
                //     }, child: const Text('Show Data '))),
              ],
            )),
      ),
    );
  }
}
