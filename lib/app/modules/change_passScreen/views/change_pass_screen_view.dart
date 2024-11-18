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
          buildTextField("Enter Your New Password", controller.newpass),
          10.heightBox,
          buildTextField(
              "Re-Enter Your New Password", controller.confirmnewpass),
          30.heightBox,
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
      controller.changepassword();
    });
  }
}
