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
                  "These Terms and Conditions apply to all Users of the ExamPrepTool Platform, including educators who are also contributors of User Content on the ExamPrepTool Platform. The ExamPrepTool Platform includes all aspects of the Website and Apps which includes but is not limited to products, software and service offered via the ExamPrepTool Platform Subject to the Terms and Conditions, Privacy Policy and all other rules and policies made available or published elsewhere, ExamPrepTool hereby grants you a non-exclusive, non-transferable, non-sublicensable, limited license to use the ExamPrepTool Platform in accordance with these Terms and Conditions. You agree and acknowledge that ExamPrepTool shall have the right at any time to change or discontinue any aspect or feature of the ExamPrepTool Platform, including, but not limited to, the User Content, hours of availability and equipment needed for access or use. Further, ExamPrepTool may discontinue disseminating any portion of information or category of information may change or eliminate any transmission method and may change transmission speeds or other signal characteristics. ExamPrepTool reserves the right to refuse access to the ExamPrepTool Platform, terminate Accounts, remove or edit contents without any notice to You.", trimLines: 18,
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
