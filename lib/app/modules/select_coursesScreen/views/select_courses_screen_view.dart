import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/select_courses_screen_controller.dart';

class SelectCoursesScreenView extends GetView<SelectCoursesScreenController> {
  const SelectCoursesScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: lineargrdient),
        child: SafeArea(
            child: Scaffold(
                appBar: buildAppbar(),
                body: Obx(() {
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
                          alignment: Alignment.center,
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(gradient: lineargrdient),
                          child: Container(
                            width: 800,
                            child: SingleChildScrollView(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    buildselectcourses("Air- 1 Notes")
                                        .onTap(() {
                                      Get.toNamed(Routes.AIR_NOTES);
                                    }),
                                    buildselectcourses("Air-1 Test series")
                                        .onTap(() {
                                      Get.toNamed(Routes.AIR_TESTSERIES);
                                    }),
                                    buildselectcourses("video lectures")
                                        .onTap(() {
                                      Get.toNamed(Routes.SELECTED_VIDIOLECTURE);
                                    }),
                                    buildselectcourses("top practice questions")
                                        .onTap(() {
                                      _showDialogUnderProcess(context);
                                    }),
                                    buildselectcourses(
                                            "20 years pyq's with answer")
                                        .onTap(() {
                                      Get.toNamed(Routes.TWENYPYS_QUESTION);
                                    }),
                                    // buildselectcourses("Live Lectures")
                                    //     .onTap(() {
                                    //   Get.toNamed(Routes.LIVE_LETCTURE);
                                    // }),
                                    buildselectcourses("TestSeries").onTap(() {
                                      Get.toNamed(Routes.TESTSEARIS);
                                    }),
                                  ]),
                            ),
                          ));
                }))));
  }

  void _showDialogUnderProcess(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Container(
            height: 250,
            decoration: BoxDecoration(gradient: horizontalGradient),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.images.headerLogo.path,
                        height: 70,
                        width: 70,
                      ),
                      Text(
                        'Work Under Development',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.white),
                InkWell(
                  onTap: () {
                    //controller.pickImageFromGallery();
                    Get.back();
                    //Get.back();
                  },
                  child: const Column(
                    children: [
                      Text(
                        'OK',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildselectcourses(String text) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: EdgeInsets.only(left: 15),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.black, // Set the shadow color here
            blurRadius: 6.0, // Adjust the blur radius
            spreadRadius: 0.0, // Adjust the spread radius
            offset: Offset(0, 2), // Adjust the offset
          ),
        ], borderRadius: BorderRadius.circular(25), gradient: cardcolor),
        child: Row(
          children: [
            text
                .toUpperCase()
                .text
                .center
                .textStyle(AppStyle.txtPoppinsMedium12White90002)
                .make()
                .expand(),
            // Container(
            //   clipBehavior: Clip.antiAliasWithSaveLayer,
            //   alignment: Alignment.center,
            //   height: 95,
            //   width: 39,
            //   decoration:
            //       BoxDecoration(shape: BoxShape.circle, gradient: buttonColor),
            //   child: Icon(
            //     Icons.arrow_drop_down,
            //     color: Colors.white,
            //     size: 35,
            //   ),
            // )
          ],
        )).paddingSymmetric(horizontal: 45, vertical: 10);
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
        decoration: BoxDecoration(gradient: lineargrdient),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Get.toNamed(Routes.HOME);
          // // Get.back();
          // Get.back();
        },
      ),
    );
  }
}
