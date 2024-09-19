import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/change_pass_screen_controller.dart';

class ChangePassScreenView extends GetView<ChangePassScreenController> {
  const ChangePassScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                Assets.images.loginHeaderBg.path,
                height: 110,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              // Add other widgets as per your requirement using Positioned widget
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
            ],
          ),
          40.heightBox,
          Image.asset(
            Assets.images.forgetPasswordImage.path,
            height: 160,
            // fit: BoxFit.cover,
            width: 200,
          ).centered(),
          40.heightBox,
          "RESET PASSWORD"
              .text
              .textStyle(AppStyle.txtPoppinsSemiBold20Black)
              .make()
              .centered()
              .paddingSymmetric(horizontal: 25, vertical: 05),
          25.heightBox,
          //Text(controller.email.toString()),
          buildTextField("Enter Your Old Password", controller.oldpass),
          10.heightBox,
           GetBuilder<ChangePassScreenController>(
                                builder: (_) => Card(
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
                                              child: Icon(Icons.lock,
                                                  color: Colors.grey),
                                            ),
                                            Expanded(
                                                child: Obx(
                                              () => TextField(
                                                onChanged: (value) {
                                                  controller
                                                      .validatePassword(value);
                                                  //controller.validatePassword;
                                                },
                                                // obscureText: !controller
                                                //     .passwordVisible.value,
                                                controller:
                                                    controller.newpass.value,
                                                maxLength: 12,
                                                decoration: InputDecoration(
                                                  labelText: "Enter password",
                                                  counterText: "",
                                                  hintStyle: TextStyle(
                                                      color: textcolor),
                                                  labelStyle: TextStyle(
                                                      color: textcolor),
                                                  border: InputBorder.none,
                                                  // suffixIcon: IconButton(
                                                  //     onPressed: () {
                                                  //       controller
                                                  //               .passwordVisible
                                                  //               .value =
                                                  //           !controller
                                                  //               .passwordVisible
                                                  //               .value;
                                                  //     },
                                                  //     icon: Icon(
                                                  //       controller
                                                  //               .passwordVisible
                                                  //               .value
                                                  //           ? Icons
                                                  //               .visibility_outlined
                                                  //           : Icons
                                                  //               .visibility_off_outlined,
                                                  //       color: Colors.grey,
                                                  //     )),

                                                  ///border: OutlineInputBorder(),),
                                                ),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ).paddingSymmetric(horizontal: 25)),
                            Obx(() {
                              if (controller.isPasswordEmpty.value) {
                                return Text('',
                                    style: TextStyle(color: Colors.red));
                              } else if (!controller.isPasswordValid.value) {
                                return Text('Invalid password format',
                                    style: TextStyle(color: Colors.red));
                              } else {
                                return SizedBox.shrink();
                              }
                            }).paddingOnly(left: 30),
                            "Password must contain minimum 8 characters, at least one uppercase, one lowercase, one number, and one special character"
                                .text
                                .textStyle(AppStyle.txtPoppinsMedium12darkGray)
                                .make()
                                .paddingSymmetric(horizontal: 25, vertical: 5),
                            GetBuilder<ChangePassScreenController>(
                              builder: (_) => Card(
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
                                      child: Row(children: [
                                        5.widthBox,
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.lock,
                                              color: Colors.grey),
                                        ),
                                        Expanded(
                                          child: TextField(
                                            controller:
                                                controller.confirmnewpass.value,
                                            onChanged: (value) {
                                              if (controller
                                                      .newpass.value.text ==
                                                  controller
                                                      .confirmnewpass.value.text) {
                                                print("correctpass");
                                              }
                                              print("wrong pass");
                                              //controller.validatePassword(value);
                                            },
                                            //obscureText: true,
                                            maxLength: 10,
                                            decoration: InputDecoration(
                                              counterText: "",
                                              hintText: "Confirm password",
                                              border: InputBorder.none,
                                              hintStyle:
                                                  TextStyle(color: textcolor),
                                              labelStyle:
                                                  TextStyle(color: textcolor),
                                            ),
                                          ),
                                        ),
                                      ]))),
                            ).paddingSymmetric(horizontal: 25),
          // buildTextField("Enter Your New Password", controller.newpass),
          // 10.heightBox,
          // buildTextField(
          //     "Re-Enter Your New Password", controller.confirmnewpass),
          30.heightBox,
           Obx(() => controller.newpass.value.text ==
                            controller.confirmnewpass.value.text
                        ? SizedBox(height: 20)
                        : Text(
                            "Passwords don't match",
                            style: TextStyle(color: Colors.red),
                          )).paddingOnly(left: 30),
          Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: 800,
                  alignment: Alignment.centerRight,
                  child: buildButton())
              .paddingSymmetric(horizontal: 40),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    ));
  }

  Widget buildTextField(String hintText, controller) {
    return Card(
        color: textfield,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        elevation: 3.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          alignment: Alignment.center,
          height: 60,
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              // labelText: "Enter Your Mobile Number",
              hintText: hintText,
              border: InputBorder.none,
            ),
          ).paddingSymmetric(horizontal: 15),
        )).paddingSymmetric(horizontal: 25).w(800);
  }

  buildButton() {
    return Container(
      alignment: Alignment.center,
      height: 50,
      //width: 270,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          gradient: horizontalGradient,
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        " RESET PASSWORD ".toUpperCase(),
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    ).onTap(() {
      // controller.changepassword();
       if (controller.newpass.value.text.isEmpty ||
        controller.confirmnewpass.value.text.isEmpty) {
      // Password is emty both or one
      print('Password fields cannot be empty');
      Get.snackbar('Error', 'Password fields cannot be empty', snackPosition: SnackPosition.TOP);
    } else if (!controller.isPasswordValid.value) {
      // failed password vaildation
      print('Invalid password format');
      Get.snackbar('Error', 'Invalid password format', snackPosition: SnackPosition.TOP);
    } else if (controller.newpass.value.text != controller.confirmnewpass.value.text) {
      // Password doesnt match
      print('Passwords do not match');
      Get.snackbar('Error', 'Passwords do not match', snackPosition: SnackPosition.TOP);
    } else {
      controller.changepassword();
      // पासवर्ड वैलिड हैं और मैच करते हैं, एपीआई कॉल करें
      // controller.resetPassword();
      // controller.forgetpass();

      // सफल एपीआई कॉल के बाद इनपुट फील्ड क्लियर करें
      controller.confirmnewpass.value.clear();
      controller.newpass.value.clear();
      // controller.otp.clear();
      
    }
    });
  }
}
