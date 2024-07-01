import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/forgetpass_screen_controller.dart';

class ForgetpassScreenView extends GetView<ForgetpassScreenController> {
  const ForgetpassScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          60.heightBox,
          Image.asset(
            Assets.images.forgetPasswordImage.path,
            height: 160,
            width: double.infinity,
          ),
          40.heightBox,
          "FORGET PASSWORD"
              .text
              .size(18)
              // .textStyle(AppStyle.txtPoppinsMedium14Gray90002)
              .fontWeight(FontWeight.w900)
              .fontFamily(
                'Poppins',
              )
              .make()
              .centered()
              .paddingSymmetric(horizontal: 25, vertical: 05),
          25.heightBox,
          buildTextField(controller.mobilenumber).w(800).centered(),
          30.heightBox,
          Container(alignment: Alignment.centerRight, child: buildButton())
              .paddingSymmetric(horizontal: 25),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    ));
  }

  Widget buildTextField(controller) {
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
            keyboardType: TextInputType.number,
            maxLength: 10,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              counterText: "",
              // labelText: "Enter Your Mobile Number",
              hintText: "Enter Your Mobile Number",
              border: InputBorder.none,
            ),
          ).paddingSymmetric(horizontal: 15),
        )).paddingSymmetric(horizontal: 25);
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
        " Submit ".toUpperCase(),
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    ).onTap(() {
      controller.sendotp();
      //controller.mobilenumber.clear();
    }).paddingSymmetric(horizontal: 25);
  }
}
