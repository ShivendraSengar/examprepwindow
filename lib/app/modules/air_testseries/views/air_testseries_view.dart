import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/widgets/custom_alert_dialog.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/air_testseries_controller.dart';

class AirTestseriesView extends GetView<AirTestseriesController> {
  AirTestseriesView({Key? key}) : super(key: key);

  //List<String> subjectid = <String>[];

  //List<String> pdfview = <String>[];
  @override
  Widget build(BuildContext context) {
    final List<CourseSub>? activeCourses;
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
                            child: SizedBox(
                              width: 800,
                              child: Column(children: [
                                60.heightBox,
                                //Text(controller.data.length.toString()),
                                "Test Series"
                                    .toUpperCase()
                                    .text
                                    .textStyle(
                                        AppStyle.txtPoppinsSemiBold14White90002)
                                    .make(),
                                //Obx(() {
                                //  // Use Obx widget to listen to changes in selectedIndex
                                //  return Text(
                                //    'Selected Index: ${controller.selectedIndex.value}',
                                //    style: TextStyle(fontSize: 18),
                                //  );
                                //}),

                                40.heightBox,
                                Container(
                                  height: 52,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: HexColor("#F3FFFF"),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(25)),
                                      border: Border.all(
                                          width: 1, color: Colors.grey)),
                                  padding:
                                      const EdgeInsets.only(left: 0, right: 0),
                                  // alignment: Alignment.center,
                                  child: Obx(() {
                                    final filteredData = controller.userdetais
                                        .where((coursedetails) =>
                                            coursedetails.active == "yes")
                                        .toList();
                                    return Container(
                                      height: 52,
                                      // width: 380,
                                      decoration: BoxDecoration(
                                        color: HexColor("#F3FFFF"),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25)),
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                      ),
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 0),
                                      child: DropdownButton<CourseSub>(
                                        hint: "Choose Course".text.make(),
                                        dropdownColor: Colors.grey.shade300,
                                        items:
                                            filteredData.map((CourseSub value) {
                                          return DropdownMenuItem<CourseSub>(
                                            value: value,
                                            child: Text(
                                              value.name.toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        value: controller.seleectrdvalue.value,
                                        underline:
                                            Container(color: Colors.black),
                                        isExpanded: true,
                                        icon: Container(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          alignment: Alignment.center,
                                          height: 95,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: buttonColor,
                                          ),
                                          child: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 38,
                                          ),
                                        ),
                                        onChanged: (CourseSub? newVal) {
                                          controller.subjectList.clear();
                                          controller.subjectList.addAll(newVal!
                                              .courseId!.exam!.subjects!
                                              .toList());
                                          if (newVal != null) {
                                            controller.selectedid.value = newVal
                                                .courseId!.exam!.id
                                                .toString();
                                            // Update the selected ID in the controller
                                            print(
                                                'Selected ID: ${controller.selectedid.value}');
                                            // Call API or perform actions with the selected value
                                            //controller.getProfile();
                                            controller.seleectrdvalue.value =
                                                newVal;
                                          }
                                        },
                                      ),
                                    );
                                  }),
                                ),
                                20.heightBox,
                                //Text(subjectid.toString()),
                                Container(
                                    height: 52,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: HexColor("#F3FFFF"),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25)),
                                        border: Border.all(
                                            width: 1, color: Colors.grey)),
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 0),
                                    // alignment: Alignment.center,
                                    child: Obx(
                                      () => DropdownButton<String>(
                                        hint: "Choose subject".text.make(),
                                        dropdownColor: Colors.grey.shade300,
                                        items: controller.subjectList
                                            .map((String subject) {
                                          return DropdownMenuItem<String>(
                                            value: subject,
                                            child: Text(
                                              subject,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        // menuMaxHeight: 10,
                                        value: controller.seleectrdvalue1.value,

                                        underline:
                                            Container(color: Colors.black),
                                        isExpanded: true,
                                        icon: Container(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          alignment: Alignment.center,
                                          height: 95,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: buttonColor),
                                          child: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 38,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          if (newValue != null) {
                                            controller.selectedSubject.value =
                                                newValue.toString();
                                            // Update the selected ID in the controller
                                            print(
                                                'Selected Subjects: ${controller.selectedSubject.value}');
                                            // Call API or perform actions with the selected value
                                            //controller.getProfile();
                                            controller.showpdfview();

                                            //controller.getVideos();
                                            //controller.fetchData();
                                          }
                                          controller.isVisible.value = true;
                                          controller.seleectrdvalue1.value =
                                              newValue.toString();
                                        },
                                      ),
                                    )),
                                //Text(controller.showpdf.length.toString()),
                                20.heightBox,

                                Obx(() {
                                  final isVisible = controller.isVisible.value;
                                  final showPdf = controller.showpdf.value;

                                  return SizedBox(
                                    width: 800,
                                    height: isVisible ? 220 : 200,
                                    child: Container(
                                      child: isVisible && showPdf.isEmpty
                                          ? CustomAlertBox(
                                              title: "No data found",
                                              message: "",
                                              onOkPressed: () {
                                                controller.isVisible.value =
                                                    false;
                                              })
                                          : isVisible
                                              ? ListView.builder(
                                                  itemCount: showPdf.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var data = showPdf[index];

                                                    return SizedBox(
                                                      width: 800,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              data.title ?? "",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          Image.asset(
                                                            Assets.images.eye
                                                                .path,
                                                            height: 25,
                                                            width: 25,
                                                          ),
                                                        ],
                                                      ).onTap(() {
                                                        
                                                        final url = data
                                                            .uploadId!
                                                            .first
                                                            .file!
                                                            .url;
                                                            print("pdf ${url}");
                                                        Get.toNamed(
                                                            Routes
                                                                .SHOW_PDF_VIEW,
                                                            arguments: url);
                                                        // Here assuming each `data.uploadId` is a list and you want the URL for the current index
                                                        //if (data.uploadId !=
                                                        //        null &&
                                                        //    index <
                                                        //        data.uploadId!
                                                        //            .length) {
                                                        //  final fileUrl = data
                                                        //      .uploadId![index]
                                                        //      .file!
                                                        //      .url
                                                        //      .toString();
                                                        //  print(
                                                        //      "pdf name $url");
                                                        //  Get.toNamed(
                                                        //    Routes
                                                        //        .SHOW_PDF_VIEW,
                                                        //    arguments: fileUrl,
                                                        //  );
                                                        //} else {
                                                        //  print(
                                                        //      "No file URL available for this item.");
                                                        //}
                                                      }),
                                                    ).paddingSymmetric(
                                                        horizontal: 10);
                                                  },
                                                )
                                              : Container(), // Empty container when isVisible is false
                                    ).paddingSymmetric(horizontal: 10),
                                  );
                                }),
                              ]),
                            ),
                          ));
                }))));
  }

  buildAppbar() {
    return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(Routes.HOME);
            // // Get.back();
            // Get.back();
          },
        ),
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
