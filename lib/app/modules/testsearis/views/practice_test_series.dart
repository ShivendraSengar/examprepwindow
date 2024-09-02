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

return Obx(() {
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
      : LayoutBuilder(
          builder: (context, constraints) {
            final isNarrowScreen = constraints.maxWidth < 600;
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(color: Vx.white),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: isNarrowScreen ? constraints.maxWidth : 800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      controller.changesvlaue.value
                          ? showlistselectedsubject(isNarrowScreen)
                          : SizedBox(),
                      // Display the allshowpdf list
                      Obx(() {
                        final allShowPdf = controller.allshowpdf.value;
                        return SizedBox(
                          width: isNarrowScreen ? constraints.maxWidth : 800,
                          height: 220,
                          child: Container(
                            child: allShowPdf.isEmpty
                                ? CustomAlertBox(
                                    title: "No data found for All Show PDF",
                                    message: "",
                                    onOkPressed: () {
                                      // Handle the case where no data is found
                                    })
                                : GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: isNarrowScreen ? 2 : 3,
                                      childAspectRatio: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    itemCount: allShowPdf.length,
                                    itemBuilder: (context, index) {
                                      var data = allShowPdf[index];
                                      return Card(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          width: isNarrowScreen ? constraints.maxWidth : 800,
                                          height: 45,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 45,
                                                width: 45,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: AssetImage(Assets.images.vector.path),
                                                  ),
                                                ),
                                                child: Text("${index + 1}. "),
                                              ),
                                              5.widthBox,
                                              Expanded(
                                                child: Text(
                                                  data.title ?? "",
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ),
                                              Image.asset(
                                                Assets.images.showicons.path,
                                                height: 25,
                                                width: 25,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ).onTap(() {
                                            final url = data.uploadId!.first.file!.url;
                                            Get.toNamed(Routes.SHOW_PDF_VIEW, arguments: url);
                                          }),
                                        ).paddingOnly(right: 10, left: 2),
                                      );
                                    },
                                  ),
                          ).paddingSymmetric(horizontal: 10),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          },
        );
});
  }
Widget showlistselectedsubject(bool isNarrowScreen) {
  return Obx(() {
    final isVisible = controller.isVisible.value;
    final showPdf = controller.showpdf.value;

    return SizedBox(
      width: isNarrowScreen ? double.infinity : 800,
      height: isVisible ? 220 : 200,
      child: Container(
        child: isVisible && showPdf.isEmpty
            ? CustomAlertBox(
                title: "No data found for Show PDF",
                message: "",
                onOkPressed: () {
                  controller.isVisible.value = false;
                },
              )
            : isVisible
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isNarrowScreen ? 2 : 3,
                      childAspectRatio: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: showPdf.length,
                    itemBuilder: (context, index) {
                      var data = showPdf[index];
                      return Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: isNarrowScreen ? double.infinity : 800,
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(Assets.images.vector.path),
                                  ),
                                ),
                                child: Text("${index + 1}. "),
                              ),
                              5.widthBox,
                              Expanded(
                                child: Text(
                                  data.title ?? "",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Image.asset(
                                Assets.images.showicons.path,
                                height: 25,
                                width: 25,
                                color: Colors.grey,
                              ),
                            ],
                          ).onTap(() {
                            final url = data.uploadId!.first.file!.url;
                            Get.toNamed(Routes.SHOW_PDF_VIEW, arguments: url);
                          }),
                        ).paddingOnly(right: 10, left: 2),
                      );
                    },
                  )
                : Container(),
      ).paddingSymmetric(horizontal: 10),
    );
  });
}
}