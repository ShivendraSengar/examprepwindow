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

          buildTextField(controller.otp, "Enter OTP"),
         

           25.heightBox,
                            GetBuilder<ResetpassScreenController>(
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
                                                    controller.newpassword.value,
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
                            GetBuilder<ResetpassScreenController>(
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
                                                controller.confirmnewpassword.value,
                                            onChanged: (value) {
                                              if (controller
                                                      .password.value.text ==
                                                  controller
                                                      .confirmnewpassword.value.text) {
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
                            // buildTextField(
                            //     Icons.share_outlined,
                            //     controller.referral,
                            //     "Enter Referral code",
                            //     "Enter Referral code"),
                        
                    // Obx(() {
                    //   if (controller.isPasswordEmpty.value) {
                    //     return Text('', style: TextStyle(color: Colors.red));
                    //   } else if (!controller.isPasswordValid.value) {
                    //     return Text('Invalid password format',
                    //         style: TextStyle(color: Colors.red));
                    //   } else {
                    //     return SizedBox.shrink();
                    //   }
                    // }),
                    Obx(() => controller.newpassword.value.text ==
                            controller.confirmnewpassword.value.text
                        ? SizedBox(height: 20)
                        : Text(
                            "Passwords don't match",
                            style: TextStyle(color: Colors.red),
                          )).paddingOnly(left: 30),
                    Container(
                            alignment: Alignment.centerRight,
                            child: buildButton())
                        .paddingSymmetric(horizontal: 25),
          40.heightBox,
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
     if (controller.newpassword.value.text.isEmpty ||
        controller.confirmnewpassword.value.text.isEmpty) {
      // Password is emty both or one
      print('Password fields cannot be empty');
      Get.snackbar('Error', 'Password fields cannot be empty', snackPosition: SnackPosition.TOP);
    } else if (!controller.isPasswordValid.value) {
      // failed password vaildation
      print('Invalid password format');
      Get.snackbar('Error', 'Invalid password format', snackPosition: SnackPosition.TOP);
    } else if (controller.newpassword.value.text != controller.confirmnewpassword.value.text) {
      // Password doesnt match
      print('Passwords do not match');
      Get.snackbar('Error', 'Passwords do not match', snackPosition: SnackPosition.TOP);
    } else {
      // password valid and match ,api call
      
      controller.resetPassword();
      controller.forgetpass();

      // sucessful clear data after api call
      controller.confirmnewpassword.value.clear();
      controller.newpassword.value.clear();
      controller.otp.clear();
    }
  }).paddingSymmetric(horizontal: 15);
}}