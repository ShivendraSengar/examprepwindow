import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({Key? key}) : super(key: key);
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
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(gradient: lineargrdient),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              // Text(controller.categorieslist.length.toString()),

                              buildcard(controller.images[0] ?? "", "All")
                                  .onTap(() {
                                Get.toNamed(Routes.MORE_COURSES);
                                // .categorieslist;
                                controller.data222 = '';
                              }),
                              8.heightBox,
                              Container(
                                height: 700,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: controller.categorieslist.length,
                                  itemBuilder: (context, index) {
                                    var data = controller.categorieslist[index];

                                    return GestureDetector(
                                        onTap: () {
                                          // Navigate to different pages based on index or data

                                          controller.data222 = '';

                                          controller.data222 = data.id
                                              .toString(); // Set the value first
                                          print(
                                              "data.id in category${controller.data222}");
                                          print(
                                              "data.id in category${controller.data222}");
                                          Get.toNamed(
                                            Routes.MORE_COURSES,
                                            arguments: data.id?.toString() ??
                                                '', // Add a null check here
                                          );
                                        },
                                        child: Container(
                                          height: 90,
                                          width: double.infinity,
                                          child: buildcard(
                                              controller.images[index] ?? "",
                                              data.category.toString() ?? ""),
                                        ));
                                  },
                                ),
                              ),
                            ]),
                          ));
                }))));
  }

  Widget buildcard(images, text) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: horizontalGradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              images,
              height: 35,
              width: 35,
              fit: BoxFit.fill,
            ),
            10.widthBox,
            Container(
                height: 19,
                child: VerticalDivider(
                  width: 16,
                )),
            10.widthBox,
            Text(
              text,
              style: AppStyle.txtPoppinsSemiBold14White90002,
            )
          ],
        ).p(25),
      ),
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
          decoration: BoxDecoration(gradient: lineargrdient),
        ));
  }
}
