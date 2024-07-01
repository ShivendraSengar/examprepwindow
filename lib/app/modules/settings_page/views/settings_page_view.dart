import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/settings_page_controller.dart';

class SettingsPageView extends GetView<SettingsPageController> {
  const SettingsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: lineargrdient),
        child: SafeArea(
            child: Scaffold(
                appBar: buildAppbar(),
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(gradient: lineargrdient),
                  child: Container(
                    width: 800,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        80.heightBox,
                        buildText("FAQ", Icons.arrow_forward_ios,
                                Assets.images.question.path)
                            .onTap(() {
                          Get.toNamed(Routes.FAQ_SCREEN);
                        }),
                        10.heightBox,
                        buildText("RESET PASSWORD", Icons.arrow_forward_ios,
                                Assets.images.resetPassword.path)
                            .onTap(() {
                          Get.toNamed(Routes.CHANGE_PASS_SCREEN);
                        }),
                        10.heightBox,
                        buildText(
                                "TERMS AND CONDITIONS",
                                Icons.arrow_forward_ios,
                                Assets.images.termCondition.path)
                            .onTap(() {
                          Get.toNamed(Routes.TERMS_CONDITIONSCREEN);
                        }),
                        10.heightBox,
                        buildText("PRIVACY POLICY", Icons.arrow_forward_ios,
                                Assets.images.termCondition.path)
                            .onTap(() {
                          Get.toNamed(Routes.PRIVACY_POLICYPAGE);
                        }),
                      ],
                    ),
                  ),
                ))));
  }

  Widget buildText(headngtext, IconData icon, String image) {
    return SizedBox(
      width: 800,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: HexColor("#13407A"),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black, // Set the shadow color here
                            blurRadius: 5.0, // Adjust the blur radius
                            spreadRadius: 0.0, // Adjust the spread radius
                            offset: Offset(0, 2), // Adjust the offset
                          ),
                        ],
                        shape: BoxShape.circle),
                    child: Image.asset(
                      image,
                      height: 30,
                      width: 30,
                    )),
                20.widthBox,
                Text(
                  headngtext,
                  style: AppStyle.txtPoppinsSemiBold16White90002,
                )
              ],
            ),
            Icon(
              icon,
              color: Colors.white,
            )
          ]).paddingSymmetric(horizontal: 20, vertical: 10),
    );
  }

  buildAppbar() {
    return AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            Assets.images.headerLogo.path,
            height: 40,
            // color: Colors.white,
            width: 110,
            fit: BoxFit.contain,
          ),
          "Exam Prep Tool"
              .text
              .size(20)
              .textStyle(AppStyle.txtPoppinsSemiBold16White90002)
              .color(Vx.white)
              .make(),
        ]),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: lineargrdient),
        ));
  }
}
