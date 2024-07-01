import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    checkLoginStatus(); // Check login status when the app starts
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Get.toNamed(Routes.HOME); // Navigate to HomeScreen
    } else {
      Get.toNamed(Routes.LOGIN_SCREEN); // Navigate to LoginScreen
    }
  }
}

//    return

//    Scaffold(
//        body: Container(
//      height: double.infinity,
//      width: double.infinity,
//      decoration: BoxDecoration(
//          image: DecorationImage(
//              image: AssetImage(
//                Assets.images.splashBg.path,
//              ),
//              fit: BoxFit.cover)),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: [
//          250.heightBox,
//          Center(
//            child: FadeIn(
//                duration: Duration(seconds: controller.duration),
//                child: Image.asset(Assets.images.headerLogo.path)),
//          ),
//          150.heightBox,
//          Align(
//              alignment: Alignment.bottomCenter,
//              child: "Exam Prep Tool"
//                  .text
//                  .size(25)
//                  .color(Vx.white)
//                  .fontWeight(FontWeight.w700)
//                  .make()),
//        ],
//      ),
//    ));
//  }
//}
