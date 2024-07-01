import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/mystory_page_controller.dart';

class MystoryPageView extends GetView<MystoryPageController> {
  const MystoryPageView({Key? key}) : super(key: key);
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
                  child: Column(
                    children: [
                      30.heightBox,
                      Image.asset(
                        Assets.images.myStory.path,
                        height: 220,
                        width: double.infinity,
                      ),
                      40.heightBox,
                      //Text(controller.email.toString()),
                      buildCard("Profile".toUpperCase()).onTap(() {
                        Get.toNamed(Routes.PROILE_PAGE);
                      }),
                      15.heightBox,
                      buildCard("Courses".toUpperCase()).onTap(() {
                        Get.toNamed(
                          Routes.COURSE_SCREEN,
                        );
                      }),
                      15.heightBox,
                      buildCard("Reset password".toUpperCase()).onTap(() {
                        Get.toNamed(
                          Routes.CHANGE_PASS_SCREEN,
                        );
                      }),
                      15.heightBox,
                      buildCard("referrals".toUpperCase()).onTap(() {
                        Get.toNamed(
                          Routes.ACCOUNT_REFERAL,
                        );
                      }),
                      15.heightBox,
                    ],
                  ),
                ))));
  }

  Widget buildCard(text) {
    return SizedBox(
      height: 60,
      width: 300,
      child: Card(
        // margin: const EdgeInsets.all(10),
        elevation: 3,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Vx.white),
          child: Text(
            text,
            style: AppStyle.txtPoppinsMedium14Gray90002,
          ),
        ),
      ),
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
