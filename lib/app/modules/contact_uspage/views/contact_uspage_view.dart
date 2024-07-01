import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_images.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/contact_uspage_controller.dart';

class ContactUspageView extends GetView<ContactUspageController> {
  const ContactUspageView({Key? key}) : super(key: key);
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
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(gradient: lineargrdient),
                  child: Container(
                    alignment: Alignment.center,
                    width: 800,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        80.heightBox,
                        CustomImageView(
                          imagePath: Assets.images.contactScreenImage.path,
                          height: 200,
                          width: 300,
                          fit: BoxFit.contain,
                        ),
                        60.heightBox,
                        buildText(
                            "Mail Us At", "Exampreptool@gmail.com", Icons.mail),
                        20.heightBox,
                        buildText("Contact Us On", "Exampreptool@gmail.com",
                            Icons.phone),
                        20.heightBox,
                        buildFaqs(
                          "Have Any Questions",
                          "Go Through Faq",
                        )
                      ],
                    ),
                  ),
                ))));
  }

  Widget buildText(headngtext, desctext, IconData icon) {
    return Container(
      alignment: Alignment.center,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  headngtext,
                  style: AppStyle.txtPoppinsSemiBold16White90002,
                ),
                5.heightBox,
                Text(
                  desctext,
                  style: AppStyle.txtPoppinsSemiBold14White90002,
                )
              ],
            ),
            Icon(
              icon,
              color: Colors.white,
            )
          ]),
    ).paddingSymmetric(horizontal: 25);
  }

  Widget buildFaqs(
    headngtext,
    desctext,
  ) {
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  headngtext,
                  style: AppStyle.txtPoppinsSemiBold16White90002,
                ),
                5.heightBox,
                Text(
                  desctext,
                  style: AppStyle.txtPoppinsSemiBold14White90002,
                )
              ],
            ),
            Image.asset(
              Assets.images.faqImg.path,
              height: 28,
              width: 28,
            )
          ]),
    ).paddingSymmetric(horizontal: 25);
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
