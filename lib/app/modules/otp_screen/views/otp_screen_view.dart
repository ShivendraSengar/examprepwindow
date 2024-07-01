import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/otp_screen_controller.dart';

class OtpScreenView extends GetView<OtpScreenController> {
  const OtpScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body:
        
         Container(
            height: double.infinity,
            width: double.infinity,
            child:SingleChildScrollView(
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
                  60.heightBox,
                  "SignUp"
                      .text
                      .size(30)
                      .fontWeight(FontWeight.w900)
                      .make()
                      .paddingSymmetric(horizontal: 25, vertical: 05),
                  5.heightBox,
                  "Please Enter otp"
                      .text
                      .size(18)
                      .color(textcolor)
                      .normal
                      .make()
                      .paddingSymmetric(horizontal: 25, vertical: 5),
                  40.heightBox,
                  //Text(controller.email[1].toString()),
                  //Text(controller.email[0].toString()),
                  buildTextField(Icons.password, controller.otp,
                      "Please Enter otp", "Please Enter otp").w(800).centered(),
                  25.heightBox,
                  Container(
                          alignment: Alignment.centerRight,
                          child: buildButton())
                      .paddingSymmetric(horizontal: 25),
                  30.heightBox,
                ],
              ),
            )));
  }

  //buildSupport() {
  //  return GestureDetector(
  //      onTap: () {
  //        Get.toNamed(Routes.SIGNUP_SCREEN);
  //        print('Text tapped!');
  //      },
  //      child: RichText(
  //        text: TextSpan(
  //          children: <TextSpan>[
  //            TextSpan(
  //              text: "Need Support ?",
  //              style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
  //            ),
  //            TextSpan(
  //              text: 'Click Here',
  //              style:
  //                  TextStyle(fontWeight: FontWeight.bold, color: textbutton),
  //            ),
  //          ],
  //        ),
  //      ));
  //}

  ////buidSignUp() {
  //  return GestureDetector(
  //      onTap: () {
  //        Get.toNamed(Routes.LOGIN_SCREEN);
  //        print('Text tapped!');
  //      },
  //      child: RichText(
  //        text: TextSpan(
  //          children: <TextSpan>[
  //            TextSpan(
  //              text: "Already have an account ?",
  //              style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
  //            ),
  //            TextSpan(
  //              text: 'SIGN IN',
  //              style:
  //                  TextStyle(fontWeight: FontWeight.bold, color: textbutton),
  //            ),
  //          ],
  //        ),
  //      ));
  //}

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
              padding: EdgeInsets.all(8.0),
              child: Icon(icon, color: Colors.grey),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                maxLength: 6,
                decoration: InputDecoration(
                  counterText: '',
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
    ).paddingSymmetric(horizontal: 25);
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
        "Submit".toUpperCase(),
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    ).onTap(() {
      controller.otpverify();
    });
  }
}
