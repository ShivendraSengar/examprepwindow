import 'package:exam_prep_tool/app/modules/proile_page/views/curve_design.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/proile_page_controller.dart';

class ProilePageView extends GetView<ProilePageController> {
  const ProilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //controller.name.value = controller.profile?.studentId?.name ?? "";
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: lineargrdient),
        child: SafeArea(
            child: Scaffold(
                appBar: buildAppbar(),
                body:
                    //        controller.isLoading.value == true
                    //            ? Center(child: CircularProgressIndicator())
                    //            : SingleChildScrollView(
                    //                child: Column(
                    //                  crossAxisAlignment: CrossAxisAlignment.start,
                    //                  children: [
                    //                    Text('Email: ${controller.profile?.studentId?.email}'),
                    //                    Text('Branch: ${controller.profile?.branch}'),
                    //                    // Add more Text widgets to display other profile data
                    //                  ],
                    //                ),
                    //              ),
                    //      )));
                    //}

                    Obx(() {
                  return controller.isLoading.isTrue
                      ? BuildShimmer(
                          child: Column(
                            children: [
                              buildSkeltion(),
                              buildSkeltion(),
                              buildSkeltion(),
                              buildSkeltion(),
                            ],
                          ),
                        )
                      : Container(
                          height: double.infinity,
                          width: double.infinity,
                          // decoration: BoxDecoration(gradient: lineargrdient),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  decoration:
                                      BoxDecoration(color: HexColor("#1b4a86")),
                                ),
                                CustomPaint(
                                  painter: CustomDesign(
                                      backgroundColor: HexColor("#285998")),
                                  size: Size.infinite,
                                ),
                                Container(
                                  width: 800,
                                  alignment: Alignment.center,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        60.heightBox,
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                                alignment: Alignment.center,
                                                height: 120,
                                                width: 120,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle),
                                                child: Image.asset(Assets
                                                    .images.profileImageBg.path)
                                                //: Image.network(imageUrl + controller.profile?.studentId?.photo

                                                //    ),
                                                ),
                                            Positioned(
                                              bottom: -10,
                                              left: 80,
                                              // right: 0,
                                              child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 50,
                                                      width: 50,
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      decoration: BoxDecoration(
                                                          gradient: buttonColor,
                                                          shape:
                                                              BoxShape.circle),
                                                      child: Image.asset(Assets
                                                                  .images
                                                                  .editImage
                                                                  .path ??
                                                              "")
                                                          .p(8))
                                                  .onTap(() {
                                                Get.toNamed(Routes.EDIT_PROILE);
                                              }),
                                            )
                                          ],
                                        ),
                                        30.heightBox,
                                        //Text(controller
                                        //        .profile?.studentId?.photo ??
                                        //    "uu"),
                                        buildText(
                                            Icons.person,
                                            controller
                                                    .profile?.studentId?.name ??
                                                ""),
                                        buildText(
                                            Icons.mail,
                                            controller.profile?.studentId
                                                    ?.email ??
                                                ""),
                                        buildText(
                                            Icons.phone,
                                            controller.profile?.studentId
                                                    ?.mobile ??
                                                "55555"),
                                        buildText(Icons.share,
                                            controller.profile?.branch ?? ""),
                                        buildText1(Icons.note_alt_outlined,
                                            controller.profile?.subjects),
                                        buildText(Icons.note_alt_outlined,
                                            controller.profile?.exam ?? ""),
                                        30.heightBox,
                                        Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors
                                                      .black, // Set the shadow color here
                                                  blurRadius:
                                                      5.0, // Adjust the blur radius
                                                  spreadRadius:
                                                      0.0, // Adjust the spread radius
                                                  offset: Offset(0,
                                                      2), // Adjust the offset
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              gradient:
                                                  buttonColor), // Add your overlay color

                                          child: Text('Edit'.toUpperCase(),
                                              style: AppStyle
                                                  .txtPoppinsSemiBold14White90002),
                                        ).onTap(() {
                                          Get.toNamed(Routes.EDIT_PROILE);
                                        }),
                                        20.heightBox,
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                }))));
  }

  Widget buildText(IconData icon, text) {
    return Container(
        // padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        height: 45,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black, // Set the shadow color here
              blurRadius: 5.0, // Adjust the blur radius
              spreadRadius: 0.0, // Adjust the spread radius
              offset: Offset(1, 2), // Adjust the offset
            ),
          ],
        ),
        // shape: BoxShape.circle),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                color: HexColor("#13407A"),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              // margin: EdgeInsets.only(left: 4, right: 100),
              padding: const EdgeInsets.only(left: 10, right: 0),
              height: 90,
              width: 680,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: HexColor("#F3FEFF"),
              ),
              child: Text(
                text,
                style: AppStyle.txtPoppinsMedium14darkGray,
              ),
            ),
          ],
        )).paddingSymmetric(horizontal: 25, vertical: 10);
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

  Widget buildText1(IconData icon, List<dynamic>? subjects) {
    return Container(
        // padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        height: 45,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black, // Set the shadow color here
              blurRadius: 5.0, // Adjust the blur radius
              spreadRadius: 0.0, // Adjust the spread radius
              offset: Offset(1, 2), // Adjust the offset
            ),
          ],
        ),
        // shape: BoxShape.circle),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                color: HexColor("#13407A"),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            5.widthBox, // Add some spacing between icon and text
            Flexible(
              child: Text(
                subjects != null && subjects.isNotEmpty
                    ? subjects.join(", ") // Join list items with comma
                    : "No subjects available",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )).paddingSymmetric(horizontal: 25, vertical: 10);
  }

  Widget buildText2(IconData icon, List<String>? exam) {
    return Container(
        // padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        height: 45,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black, // Set the shadow color here
              blurRadius: 5.0, // Adjust the blur radius
              spreadRadius: 0.0, // Adjust the spread radius
              offset: Offset(1, 2), // Adjust the offset
            ),
          ],
        ),
        // shape: BoxShape.circle),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                color: HexColor("#13407A"),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            5.widthBox, // Add some spacing between icon and text
            Flexible(
              child: Text(
                exam != null && exam.isNotEmpty
                    ? exam.join(", ") // Join list items with comma
                    : "No exams available",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )).paddingSymmetric(horizontal: 25, vertical: 10);
  }
}
