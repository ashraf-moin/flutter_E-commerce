import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isSaved = ''.obs;
  var email = ''.obs;
  var password = ''.obs;


  Future<void> setLoginInfo(String email,String password)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString('emailKey', email);
    // preferences.setString('passwordKey', password);

    // Check if the email key already exists in SharedPreferences
    bool emailExists = preferences.containsKey('emailKey');

    if (!emailExists) {
      // If email key doesn't exist, save email and password
      preferences.setString('emailKey', email);
      preferences.setString('passwordKey', password);
    } else {
      preferences.remove('emailKey');
      preferences.remove('passwordKey');
      preferences.setString('emailKey', email);
      preferences.setString('passwordKey', password);
    }


  }

  Future<void> getLoginInfo()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email.value = preferences.getString('emailKey')!;
    password.value = preferences.getString('passwordKey')!;


  }
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}