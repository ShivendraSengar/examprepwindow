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
//    return Scaffold(
//      body: Center(
//        child: Container(
//          color: Colors.grey.shade300,
//          height: 190,
//          width: 650,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: [
//              8.heightBox,
//              "We Are offering".text.size(16).make(),
//              5.heightBox,
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  "Online Test Series".text.size(16).make(),
//                  5.widthBox,
//                  "for"
//                      .text
//                      .size(16)
//                      .color(const Color.fromARGB(255, 228, 121, 7))
//                      .make()
//                ],
//              ),
//              8.heightBox,
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [
//                  buildCard("GATE CSE"),
//                  buildCard("GATE DA"),
//                  buildCard("DSA COURES"),
//                ],
//              ).w(500)
//            ],
//          ),
//        ),
//      ),
//    );
//  }

//  buildCard(text) {
//    return Card(
//      color: Vx.gray100,
//      child: Container(
//        height: 45,
//        padding: EdgeInsets.symmetric(horizontal: 8),
//        alignment: Alignment.center,
//        child: Text(text),
//      ),
//    );
//  }
//}
    final List<CourseSub>? activeCourses;
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: lineargrdient),
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
                        20.heightBox,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              20.heightBox,
                              Container(
                                height: 52,
                                width: 350,
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
                                        left: 18, right: 0),
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
                                      underline: Container(color: Colors.black),
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
                                  width: 350,
                                  decoration: BoxDecoration(
                                      color: HexColor("#F3FFFF"),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(25)),
                                      border: Border.all(
                                          width: 1, color: Colors.grey)),
                                  padding:
                                      const EdgeInsets.only(left: 18, right: 0),
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

                                      underline: Container(color: Colors.black),
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
                            ]),
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
                                      ? ListView.builder(
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
