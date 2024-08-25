import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/modules/testsearis/controllers/testsearis_controller.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_alert_dialog.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

class PracticeTestSeries extends GetView<TestsearisController> {
  const PracticeTestSeries({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<CourseSub>? activeCourses;
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            // gradient: lineargrdient
            color: Vx.white),
        child: SafeArea(child: Scaffold(
            //appBar: buildAppbar(),
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
                  decoration: BoxDecoration(color: Vx.white),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: 800,
                      child: Column(children: [
                        Text(controller.testSeries.length.toString()),
                        Obx(() {
                          final isVisible = controller.isVisible.value;
                          final showPdf = controller.showpdf.value;

                          return SizedBox(
                            width: 800,
                            height: isVisible ? 220 : 200,
                            child: Container(
                              width: 200,

                              child: isVisible && showPdf.isEmpty
                                  ? CustomAlertBox(
                                      title: "No data found",
                                      message: "",
                                      onOkPressed: () {
                                        controller.isVisible.value = false;
                                      })
                                  : isVisible
                                      ? GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount:
                                                3, // Number of items per row
                                            childAspectRatio:
                                                3, // Adjust height and width ratio of items
                                            crossAxisSpacing:
                                                10, // Spacing between columns
                                            mainAxisSpacing:
                                                10, // Spacing between rows
                                          ),
                                          itemCount: showPdf.length,
                                          itemBuilder: (context, index) {
                                            var data = showPdf[index];
                                            print(
                                                "showPdf[index]${showPdf[index]}");
                                            return Card(
                                                child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              width: 800,
                                              height: 45,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 45,
                                                    width: 45,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              Assets.images
                                                                  .vector.path),
                                                        )),
                                                    child:
                                                        Text("${index + 1}. "),
                                                  ),
                                                  5.widthBox,
                                                  Expanded(
                                                    child: Text(
                                                      data.title ?? "",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  Image.asset(
                                                    Assets
                                                        .images.showicons.path,
                                                    height: 25,
                                                    width: 25,
                                                    color: Colors.grey,
                                                  ),
                                                ],
                                              ).onTap(() {
                                                final url = data
                                                    .uploadId!.first.file!.url;
                                                print("pdf ${url}");
                                                Get.toNamed(
                                                    Routes.SHOW_PDF_VIEW,
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
                                            ).paddingOnly(right: 10, left: 2));
                                          },
                                        )
                                      : Container(), // Empty container when isVisible is false
                            ).paddingSymmetric(
                              horizontal: 10,
                            ),
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
