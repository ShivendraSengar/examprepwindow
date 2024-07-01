import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/resetpass_screen_controller.dart';

class ResetpassScreenView extends GetView<ResetpassScreenController> {
  const ResetpassScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
          child: Column(
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
          20.heightBox,
          Image.asset(
            Assets.images.forgetPasswordImage.path,
            height: 140,
            // fit: BoxFit.cover,
            width: 200,
          ).centered(),
          20.heightBox,
          "RESET PASSWORD"
              .text
              .textStyle(AppStyle.txtPoppinsSemiBold20Black)
              .fontWeight(FontWeight.w900)
              .fontFamily(
                'Poppins',
              )
              .make()
              .centered()
              .paddingSymmetric(horizontal: 25, vertical: 05),
          "This Mobile Number +91 ${controller.email[1].toString()} "
// is Linked with this Email vi*******ey@gmailcom"
              .text
              .center
              .textStyle(AppStyle.txtPoppinsMedium14Gray90002)
              .make()
              .centered()
              .paddingSymmetric(horizontal: 25, vertical: 05),
          "is Linked with this Email ${controller.obscureEmail(controller.email[0].toString())}"
// is Linked with this Email vi*******ey@gmailcom"
              .text
              .center
              // .size(15)
              .color(textcolor)
              .textStyle(AppStyle.txtPoppinsMedium14Gray90002)
              .make()
              .centered()
              .paddingSymmetric(horizontal: 25, vertical: 05),
          10.heightBox,

          buildTextField(controller.otp, "Enter OTP").w(800).centered(),
          10.heightBox,
          buildTextField1(controller.newpassword, 'Enter Password',
              onChanged: controller.validatePassword).w(800).centered(),

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

          //buildTextField(controller.newpassword, "Enter New Password"),
          10.heightBox,
          "Password must contain minimum 8 characters, at least one uppercase, one lowercase, one number, and one special character"
              .text
              .textStyle(AppStyle.txtPoppinsMedium12darkGray)
              .make()
              .paddingSymmetric(horizontal: 25, vertical: 5).w(780).centered(),
          buildTextField(
              controller.confirmnewpassword, "Re- Enter New password").w(800).centered(),
          15.heightBox,
          Container(
                  // width: 300,
                  alignment: Alignment.center,
                  child: buildButton())
              .paddingSymmetric(horizontal: 25).w(800).centered(),
        ],
      )),
    ));
  }

  Widget buildTextField(controller, hinttext) {
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
            maxLength: 10,
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              // labelText: "Enter Your Mobile Number",
              hintText: hinttext,
              counterText: '',
              border: InputBorder.none,
            ),
          ).paddingSymmetric(horizontal: 15),
        )).paddingSymmetric(horizontal: 25);
  }

  Widget buildTextField1(controller, hinttext,
      {ValueChanged<String>? onChanged}) {
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
          maxLength: 10,
          controller: controller,
          textAlign: TextAlign.center,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hinttext,
            counterText: '',
            border: InputBorder.none,
          ),
        ).paddingSymmetric(horizontal: 15),
      ),
    ).paddingSymmetric(horizontal: 25);
  }

  buildButton() {
    return Container(
      alignment: Alignment.center,
      height: 60,
      //width: 260,
      decoration: BoxDecoration(
          gradient: horizontalGradient,
          borderRadius: BorderRadius.circular(35)),
      child: Text(
        " reset password ".toUpperCase(),
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    ).onTap(() {
      controller.resetPassword();
      if (controller.newpassword.value.text.isNotEmpty &&
          controller.confirmnewpassword.value.text.isNotEmpty) {
        if (controller.newpassword.value.text ==
            controller.confirmnewpassword.value.text) {
          // Passwords match, proceed with API call
          controller.forgetpass();

          // Clear the input fields after a successful API call
          controller.confirmnewpassword.clear();
          controller.newpassword.clear();
        } else {
          // Passwords don't match, handle this case as needed
          print('Passwords do not match');
        }
      } else {
        // One or both password fields are empty, handle this case as needed
        print('Password fields cannot be empty');
      }
    }).paddingSymmetric(horizontal: 15);
  }
}
