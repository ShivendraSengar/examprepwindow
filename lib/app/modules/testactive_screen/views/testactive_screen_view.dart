import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/testactive_screen_controller.dart';

class TestactiveScreenView extends GetView<TestactiveScreenController> {
  const TestactiveScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              20.widthBox,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Test(',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Active',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    TextSpan(
                      text: ')',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
              20.heightBox,
              buildRow(Assets.images.totalQuestion.path,
                  'total 30 questions'.toUpperCase()),
              buildRow(Assets.images.timer.path,
                  'total time 30 Minutes'.toUpperCase()),
              buildRow(Assets.images.totalMarks.path,
                  'total marks 60'.toUpperCase()),
              buildRow(Assets.images.language.path,
                  'language- English'.toUpperCase()),
              "Declaration : ".text.size(18).make().paddingOnly(left: 20),
              Container(
                width: 1900,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() => Checkbox(
                          value: controller.isChecked.value,
                          onChanged: controller.toggleCheckbox,
                        )),
                    10.widthBox,
                    Text(
                      "I have read all the instructions carefully and have understood them. I agree not to cheat or use unfair means in this examination. I understand that using unfair means of any sort for my own or someone else's advantage will lead to my immediate disqualification. The decision of Exampreptool will be final in these matters and cannot be appealed.",
                      maxLines: 6,
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow
                          .ellipsis, // Adds ellipsis if text overflows
                    ).w(900)
                  ],
                ),
              ),
              20.heightBox,
              InkWell(
                onTap: () {
                  //print("object${coursedetails.rating}");
                  //print("purchase${coursedetails.purchased}");
                  if (controller.isChecked.value == true) {
                    Get.toNamed(Routes.TESTSERIES_MCQ);
                  }

                  //print("exam idddd${coursedetails.exam?.id}"),

                  // offercodes?.offerName,
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    //padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    height: 45,
                    width: 250,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        //gradient: buttonColor,
                        color: Colors.green),
                    child: const Text(
                      'Ready to Begin',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              20.heightBox
            ]),
      ),
    );
  }

  buildRow(String image, text) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.white, // Set the shadow color here
                blurRadius: 5.0, // Adjust the blur radius
                spreadRadius: 0.0, // Adjust the spread radius
                offset: Offset(0, 2), // Adjust the offset
              ),
            ],
          ),
          height: 40,
          width: 40,
          child: Image.asset(
            image,
            //Assets.images.headerLogo.path,
            //height: 40,
            //// color: Colors.white,
            //width: 110,
            fit: BoxFit.cover,
          ),
        ),
        8.widthBox,
        Text(
          text,
        )
      ],
    ).paddingSymmetric(horizontal: 15, vertical: 8);
  }
}

buildAppbar() {
  return AppBar(
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          Assets.images.headerLogo.path,
          height: 40,
          width: 110,
          fit: BoxFit.contain,
        ),
        "Exam Prep Tool"
            .text
            .size(20)
            .textStyle(AppStyle.txtPoppinsSemiBold16White90002)
            .color(Vx.white)
            .make(),
      ],
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(gradient: lineargrdient),
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    ),
  );
}