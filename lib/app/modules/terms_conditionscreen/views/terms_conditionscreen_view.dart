import 'package:exam_prep_tool/app/modules/terms_conditionscreen/views/my_clipper.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:readmore/readmore.dart';

import 'package:velocity_x/velocity_x.dart';

import '../controllers/terms_conditionscreen_controller.dart';

class TermsConditionscreenView extends GetView<TermsConditionscreenController> {
  const TermsConditionscreenView({Key? key}) : super(key: key);

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
                  // decoration: BoxDecoration(gradient: lineargrdient),
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: HexColor("#1b4a86")),
                        ),
                        CustomPaint(
                          painter: WaveCustomPaint(
                              backgroundColor: HexColor("#285998")),
                          size: Size.infinite,
                        ),
                        Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //60.heightBox,
                                buildText(
                                  "TERMS And CONDITION",
                                ),
                              ],
                            ).marginOnly(bottom: 170),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}

Widget buildText(
  headngtext,
) {
  return Container(
    alignment: Alignment.center,
    height: Get.height,
    width: 800,
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        //scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            //height: Get.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: HexColor("#13407A"),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black, // Set the shadow color here
                  blurRadius: 5.0, // Adjust the blur radius
                  spreadRadius: 0.0, // Adjust the spread radius
                  offset: Offset(0, 2), // Adjust the offset
                ),
              ],
            ),
            // shape: BoxShape.circle),
            child: Column(
              children: [
                20.heightBox,
                Text(
                  headngtext,
                  style: AppStyle.txtPoppinsSemiBold14White90002,
                  textAlign: TextAlign.justify,
                ),
                20.heightBox,
                ReadMoreText(
                  "By downloading or using the app, these terms will automatically apply to you- you should make sure therefore that you read them carefully before using the app. You're not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You're not allowed to attempt to extract the source code of the app, and you also shouldn't try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to Exampreptool Pvt Ltd.Exampreptool Pvt Ltd is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you're paying for.The Exampreptool Pvt Ltd app stores and processes personal data that you have provided to us, in order to provide our Service. It's your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions using the app, these terms will automatically apply to you- you should make sure therefore that you read them carefully before using the app. You're not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You're not allowed to attempt to extract the source code of the app, and you also shouldn't try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to Exampreptool Pvt Ltd.Exampreptool Pvt Ltd is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you're paying for.The Exampreptool Pvt Ltd app stores and processes personal data that you have provided to us, in order to provide our Service. It's your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions",
                  trimLines: 18,
                  textAlign: TextAlign.justify,
                  style: AppStyle.txtPoppinsMedium12White90002,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' View more',
                  trimExpandedText: ' Show Less',
                  lessStyle: TextStyle(
                      color: Colors.pinkAccent.shade400,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  moreStyle: TextStyle(
                      color: Color.fromARGB(255, 220, 107, 147),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
                .paddingOnly(left: 15, right: 15, bottom: 50)
                .marginOnly(bottom: 0),
          )
              .paddingSymmetric(horizontal: 25, vertical: 10)
              .marginOnly(bottom: 150);
        }),
  );
}

buildAppbar() {
  return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
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
        decoration: BoxDecoration(color: HexColor("#1b4a86")),
      ));
}
