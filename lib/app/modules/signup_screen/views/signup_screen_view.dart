import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/signup_screen_controller.dart';

class SignupScreenView extends GetView<SignupScreenController> {
  const SignupScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.isLoading == true
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.images.loginHeaderBg.path,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      height: 900,
                      width: 800,
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            60.heightBox,
                            "SignUp"
                                .text
                                .size(30)
                                .fontWeight(FontWeight.w900)
                                .make()
                                .paddingSymmetric(horizontal: 25, vertical: 05),
                            5.heightBox,
                            "Please Signup to Continue"
                                .text
                                .size(18)
                                .color(textcolor)
                                .normal
                                .make()
                                .paddingSymmetric(horizontal: 25, vertical: 5),
                            40.heightBox,
                            buildTextField(
                                Icons.person,
                                controller.name,
                                "Please Enter Your Name",
                                "Please Enter Your Name"),
                            25.heightBox,
                            buildTextField(
                                Icons.lock,
                                controller.email,
                                "Please Enter Your E-mail Address",
                                "Please Enter Your E-mail Address"),
                            25.heightBox,
                            buildphone(
                                Icons.call,
                                controller.phone,
                                "Please Enter Your Mobile  Number",
                                "Please Enter Your Mobile  Number"),
                            25.heightBox,
                            GetBuilder<SignupScreenController>(
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
                                                obscureText: !controller
                                                    .passwordVisible.value,
                                                controller:
                                                    controller.password.value,
                                                maxLength: 12,
                                                decoration: InputDecoration(
                                                  labelText: "Enter password",
                                                  counterText: "",
                                                  hintStyle: TextStyle(
                                                      color: textcolor),
                                                  labelStyle: TextStyle(
                                                      color: textcolor),
                                                  border: InputBorder.none,
                                                  suffixIcon: IconButton(
                                                      onPressed: () {
                                                        controller
                                                                .passwordVisible
                                                                .value =
                                                            !controller
                                                                .passwordVisible
                                                                .value;
                                                      },
                                                      icon: Icon(
                                                        controller
                                                                .passwordVisible
                                                                .value
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined,
                                                        color: Colors.grey,
                                                      )),

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
                            }),
                            "Password must contain minimum 8 characters, at least one uppercase, one lowercase, one number, and one special character"
                                .text
                                .textStyle(AppStyle.txtPoppinsMedium12darkGray)
                                .make()
                                .paddingSymmetric(horizontal: 25, vertical: 5),
                            GetBuilder<SignupScreenController>(
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
                                                controller.confirmpass.value,
                                            onChanged: (value) {
                                              if (controller
                                                      .password.value.text ==
                                                  controller
                                                      .confirmpass.value.text) {
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
                            25.heightBox,
                            buildTextField(
                                Icons.share_outlined,
                                controller.referral,
                                "Enter Referral code",
                                "Enter Referral code"),
                          ])),
                    ),
                    Obx(() {
                      if (controller.isPasswordEmpty.value) {
                        return Text('', style: TextStyle(color: Colors.red));
                      } else if (!controller.isPasswordValid.value) {
                        return Text('Invalid password format',
                            style: TextStyle(color: Colors.red));
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
                    Obx(() => controller.password.value.text ==
                            controller.confirmpass.value.text
                        ? SizedBox(height: 20)
                        : Text(
                            "Passwords don't match",
                            style: TextStyle(color: Colors.red),
                          )),
                    Container(
                            alignment: Alignment.centerRight,
                            child: buildButton())
                        .paddingSymmetric(horizontal: 25),
                    30.heightBox,
                    Container(
                        height: 35,
                        alignment: Alignment.center,
                        child: buidSignIn()),
                    Container(
                        height: 35,
                        alignment: Alignment.center,
                        child: buildSupport()),
                    30.heightBox
                  ],
                ),
              ));
  }

  buildSupport() {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.SIGNUP_SCREEN);
          print('Text tapped!');
        },
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Need Support ?",
                style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
              ),
              TextSpan(
                text: 'Click Here',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: textbutton),
              ),
            ],
          ),
        ));
  }

  buidSignIn() {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.LOGIN_SCREEN);
          controller.name.clear();
          controller.email.clear();
          controller.phone.clear();
          controller.referral.clear();
          controller.password.value.clear();
          controller.confirmpass.value.clear();
        },
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Already have an account ?",
                style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
              ),
              TextSpan(
                text: 'SIGN IN',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: textbutton),
              ),
            ],
          ),
        ));
  }

  Widget buildphone(IconData icon, controller, labeltext, hinttext) {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, color: Colors.grey),
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: controller,
                decoration: InputDecoration(
                  counterText: "",
                  labelText: labeltext,
                  hintText: hinttext,
                  hintStyle: TextStyle(color: textcolor),
                  labelStyle: TextStyle(color: textcolor),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    ).paddingSymmetric(horizontal: 25).w(800);
  }

  Widget buildTextField(IconData icon, controller, labeltext, hinttext) {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, color: Colors.grey),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: labeltext,
                  hintText: hinttext,
                  hintStyle: TextStyle(color: textcolor),
                  labelStyle: TextStyle(color: textcolor),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    ).paddingSymmetric(horizontal: 25).w(800);
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
        "Sign up".toUpperCase(),
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    ).onTap(() {
      controller.resetPassword();

// Check if required fields are not empty
      if (controller.name.text.isNotEmpty &&
          controller.email.text.isNotEmpty &&
          controller.phone.text.isNotEmpty &&
          controller.password.value.text.isNotEmpty &&
          controller.confirmpass.value.text.isNotEmpty) {
        // Check if the password and confirm password match
        if (controller.password.value.text ==
            controller.confirmpass.value.text) {
          // Call the signup API
          controller.signup();

          // Clear the form fields
          controller.name.clear();
          controller.email.clear();
          controller.phone.clear();
          controller.referral.clear();
          controller.password.value.clear();
          controller.confirmpass.value.clear();

          print('Text tapped!');
          print("correctpass");
        } else {
          print("Password and confirm password do not match");
        }
      } else {
        showToastMessage("please ", "fill all deetails carefully");
      }
    });
  }
}
