import 'package:exam_prep_tool/app/modules/courses_categories/views/categories_view.dart';
import 'package:exam_prep_tool/app/modules/more_courses/views/more_courses_view.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/course_screen_controller.dart';

class CourseScreenView extends GetView<CourseScreenController> {
  const CourseScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: lineargrdient),
        child: SafeArea(
            child: Scaffold(
          appBar: controller.userdetais.length == null ||
                  controller.userdetais.isEmpty
              ? null
              : buildAppbar(),
          body: Obx(() {
            return controller.isLoading.isTrue
                ? BuildShimmer(
                    child: Column(
                      children: [
                        //Text(controller.userdetais.length.toString()),
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
                    //width: 800,
                    decoration: BoxDecoration(gradient: lineargrdient),
                    child: SingleChildScrollView(
                        child: SizedBox(
                            height: Get.height,
                            child: controller.userdetais.isEmpty ||
                                    controller.userdetais.length == null
                                ? Container(
                                    height: 100,
                                    width: 600,
                                    child: Card(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        "you haven't subscribed any courses yet ..."
                                            .text
                                            .make(),
                                        10.heightBox,
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.toNamed(Routes.HOME);
                                                },
                                                child: Text("Cancel")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.toNamed(Routes.CATEGORIES);
                                                },
                                                child: Text("Explore courses")),
                                          ],
                                        )
                                      ],
                                    )),
                                  ).paddingSymmetric(
                                    horizontal: 24, vertical: 190)
                                : Container(
                                    height: Get.height,
                                    width: 800,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: controller.userdetais.length,
                                        itemBuilder: (context, index) {
                                          var data =
                                              controller.userdetais[index];
                                          return Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 10),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 25),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                gradient: cardcolor,
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
                                              ),
                                              child: Column(
                                                children: [
                                                  //Text(controller.userdetais.length
                                                  //    .toString()),
                                                  buildCard(
                                                      "Course Title",
                                                      data.courseId?.name ??
                                                          ""),
                                                  buildCard(
                                                      "Course Id",
                                                      data.courseId?.number ??
                                                          ""),
                                                  buildCard("Amount",
                                                      "Rs.${data.courseId?.cost.toString() ?? ""}"),
                                                  buildCard("Start Date",
                                                      data.startDate ?? ""),
                                                  buildCard("End Date",
                                                      data.expiry ?? ""),

                                                  buildCard1("Status",
                                                      data.active ?? "")
                                                ],
                                              ));
                                        }).marginOnly(bottom: 60),
                                  ))));
          }),
        ))));
  }

  Widget buildCard1(String title, String activeStatus) {
    String statusText = activeStatus == "yes" ? "Active" : "Expired";

    return Container(
      height: 60,
      width: 800,
      child: Card(
        // margin: const EdgeInsets.all(10),
        elevation: 3,
        color: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              //decoration: BoxDecoration(color: Vx.white),
              child: Text(
                title,
                style: AppStyle.txtPoppinsMedium14Gray90002,
              ),
            ),
            Container(
              alignment: Alignment.center,
              //decoration: BoxDecoration(color: Vx.white),
              child: Text(
                statusText,
                style: AppStyle.txtPoppinsMedium14Gray90002,
              ),
            ).paddingSymmetric(horizontal: 3),
          ],
        ).paddingSymmetric(horizontal: 7),
      ),
    );
  }

  Widget buildCard(text, title) {
    return Container(
      height: 60,
      width: 800,
      child: Card(
        // margin: const EdgeInsets.all(10),
        elevation: 3,
        color: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              //decoration: BoxDecoration(color: Vx.white),
              child: Text(
                text,
                style: AppStyle.txtPoppinsMedium14Gray90002,
              ),
            ),
            Container(
              alignment: Alignment.center,
              //decoration: BoxDecoration(color: Vx.white),
              child: Text(
                title,
                style: AppStyle.txtPoppinsMedium14Gray90002,
              ),
            ).paddingSymmetric(horizontal: 3),
          ],
        ).paddingSymmetric(horizontal: 7),
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
