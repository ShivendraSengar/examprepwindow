

import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_textfield.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Container(
        padding: EdgeInsets.all(0),
        color: Colors.red,
        child: SafeArea(
          left: true,
          top: true,
          child: Scaffold(
            // backgroundColor: Colors.amber,
            body: Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.images.loginHeaderBg.path,
                        height: 90,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                      20.heightBox,
                      Container(
                        height: 900,
                        width: 800,
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                            child: SizedBox(
                          width: 800,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Login"
                                  .text
                                  .size(30)
                                  // .textStyle(AppStyle.txtPoppinsMedium14Gray90002)
                                  .fontWeight(FontWeight.w900)
                                  .fontFamily(
                                    'Poppins',
                                  )
                                  .make()
                                  .paddingSymmetric(
                                      horizontal: 25, vertical: 05).onTap(() {Get.toNamed(Routes.RAZOR_PAY_WINDOW);}),
                              5.heightBox,
                              "Please Signin to Continue"
                                  .text
                                  .textStyle(
                                      AppStyle.txtPoppinsMedium14Gray90002)
                                  .color(textcolor)
                                  .make()
                                  .paddingSymmetric(
                                      horizontal: 25, vertical: 5),
                              40.heightBox,
                              Container(
                                alignment: Alignment.center,
                                height: 65,
                                child: MyCustomTextField(
                                  controller: controller.email,

                                  //labelText: 'Enter your E -mail',
                                  hintText: 'Enter your E -mail',
                                  prefixIcon: Icons.email,
                                  suffixIcon: Icons.visibility,
                                  onChanged: (value) {
                                    // Handle the text input changes
                                    print('Input changed: $value');
                                  },
                                ).paddingSymmetric(horizontal: 35),
                              ),
                              20.heightBox,
                               buildTextField(controller.password, controller.isPasswordVisible), // Use password controller
           
                              // buildTextField(controller,  isPasswordVisible.value),
                              // buildTextField(controller, controller.isPasswordVisible),
                              25.heightBox,
                              Container(
                                      alignment: Alignment.centerRight,
                                      child: buildButton())
                                  .paddingSymmetric(horizontal: 25),
                              SizedBox(
                                height: Get.height / 6.5,
                              ),
                              Container(
                                  height: 50,
                                  alignment: Alignment.bottomCenter,
                                  child: buidSignUp()),
                              20.heightBox,
                            ],
                          ),
                        )),
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }

  buidSignUp() {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.SIGNUP_SCREEN);
          controller.email.clear();
          controller.password.clear();
          print('Text tapped!');
        },
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Don't have an account ?",
                style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
              ),
              TextSpan(
                text: 'SIGN UP',
                style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
              ),
            ],
          ),
        ));
  }

Widget buildTextField(TextEditingController controller, RxBool isPasswordVisible) {
  return Card(
    color: textfield,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
    ),
    elevation: 3.0,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: SizedBox(
      height: 60,
      child: Row(
        children: [
          5.widthBox,
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.lock, color: Colors.grey),
          ),
          Expanded(
            child: Obx(
              () => TextField(
                obscureText: !isPasswordVisible.value,  // Password visibility toggle
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          
          // Password visibility toggle button
          Obx(
            () => IconButton(
              icon: Icon(
                isPasswordVisible.value
                    ? Icons.visibility // Hide icon
                    : Icons.visibility_off,    // Show icon
                color: Colors.grey,
              ),
              onPressed: () {
                // Toggle password visibility
                isPasswordVisible.value = !isPasswordVisible.value;
              },
            ),
          ),

          InkWell(
            onTap: () {
              Get.toNamed(Routes.FORGETPASS_SCREEN);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                'Forget?',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 2, 32, 85),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ).paddingSymmetric(horizontal: 35);
}
 buildButton() {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: 125,
      decoration: BoxDecoration(
          gradient: horizontalGradient,
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        "Sign in".toUpperCase(),
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    ).onTap(() {
      emailtext == controller.email.text;
      controller.login();
      //Get.toNamed(Routes.WATERMARK);
    });
  }
}
