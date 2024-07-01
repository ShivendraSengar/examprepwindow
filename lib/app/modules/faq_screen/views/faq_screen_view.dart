import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/faq_screen_controller.dart';

class FaqScreenView extends GetView<FaqScreenController> {
  const FaqScreenView({Key? key}) : super(key: key);
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SizedBox(
                      width: 600,
                      child: Column(
                        children: [
                          30.heightBox,
                          buildText(),
                          30.heightBox,
                        ],
                      ),
                    ),
                  ),
                ))));
  }

  Widget buildText() {
    return Container(
      height: 900,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.accordionItems.length,
          itemBuilder: (context, index) {
            var data = controller.accordionItems[index];
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              alignment: Alignment.center,
              // height: Get.height,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  10.widthBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ques : ${data.id.toString()}",
                        style: AppStyle.txtPoppinsSemiBold14White90002,
                      ),
                      10.widthBox,
                      Text(
                        data.title,
                        style: AppStyle.txtPoppinsSemiBold14White90002,
                      ).w(280)
                    ],
                  ),
                  10.heightBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Ans : ',
                        style: AppStyle.txtPoppinsSemiBold14White90002,
                      ),
                      10.widthBox,
                      Container(
                        width: 280,
                        child: Text(
                          data.answer.isNotEmpty
                              ? data.answer
                              : data.screen.toString(),
                          style: AppStyle.txtPoppinsMedium12White90002,
                          maxLines: 8,
                          textAlign: TextAlign.justify,
                        ).paddingOnly(bottom: 5, right: 8, left: 8),
                      ).onTap(() {
                        _launchURL(data.screen!);
                      }),
                    ],
                  ),
                  20.heightBox
                ],
              ).paddingSymmetric(horizontal: 15),
            ).paddingSymmetric(horizontal: 20, vertical: 10);
          }),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
