import 'package:exam_prep_tool/app/modules/terms_conditionscreen/views/my_clipper.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:readmore/readmore.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/privacy_policypage_controller.dart';

class PrivacyPolicypageView extends GetView<PrivacyPolicypageController> {
  const PrivacyPolicypageView({Key? key}) : super(key: key);
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
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                40.heightBox,
                                buildText("PRIVACY POLICY")
                              ],
                            ),
                          ),
                        )
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
      height: Get.height,
      width: 800,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
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
                    " App Privacy Policy Generator Generate a generic Privacy Policy and Terms & Conditions for your apps Built with heart by Anudivya and contributors Twitter Github Disclaimer. Free privacy policy hosting + website for Exampreptool Pvt Ltd.The accuracy of the generated privacy policy and terms & conditions on this website is not legally binding. Use at your risk.Read the full Disclaimer here. If you appreciate my work, consider buying me a cup of to keep me recharged The Exampreptool Pvt Ltd app as a Free app. This SERVICE is provided by Exampreptool Pvt Ltd at no cost and is intended for use as is.This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Exampreptool Pvt Ltd unless otherwise defined in this Privacy Policy.Information Collection and Use.",
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
                  10.heightBox,
                  10.heightBox,
                ],
              )
                  .paddingOnly(left: 15, right: 15, bottom: 0)
                  .marginOnly(bottom: 0),
            )
                .paddingSymmetric(horizontal: 25, vertical: 10)
                .marginOnly(bottom: 150);
          }));
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
        decoration: BoxDecoration(color: HexColor("#1b4a86")),
      ));
}
