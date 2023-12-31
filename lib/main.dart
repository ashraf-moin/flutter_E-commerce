import 'package:ecommerce/Bindings/initBinding.dart';
import 'package:ecommerce/route/app_page.dart';
import 'package:ecommerce/route/app_routes.dart';
import 'package:ecommerce/view/home_page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';


class Appcolors {
  static const Color c1 = const Color(0xFF9381ff);
  static const Color c2 = const Color(0xFFb8b8ff);
  static const Color c3 = const Color(0xFFf8f7ff);
}


void main() async {

  // await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF9381ff)),
        useMaterial3: false,
        fontFamily: "Poppins",
      ),
        initialRoute: AppRoutes.LOGIN,
        getPages: AppPages.pages,
        initialBinding: InitialBinding(),
    );
  }
}

