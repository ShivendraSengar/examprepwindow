import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';
import 'package:exam_prep_tool/app/modules/play_vidio/controllers/play_vidio_controller.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_alert_dialog.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/selected_vidiolecture_controller.dart';

class SelectedVidiolectureView extends GetView<SelectedVidiolectureController> {
  const SelectedVidiolectureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  //physics: NeverScrollableScrollPhysics(),
                  child: Column(children: [
                    30.heightBox,

                    //Text(controller.vidiolist.first.exam!.subjects.toString()),
                    //Text(controller.subject.toString()),
                    //Text(controller.courdata.length.toString()),

                    "video lectures"
                        .toUpperCase()
                        .text
                        .textStyle(AppStyle.txtPoppinsSemiBold14White90002)
                        .make(),
                    20.heightBox,
                    //first dropdown
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        height: 52,
                        // width: 300,
                        decoration: BoxDecoration(
                            color: HexColor("#F3FFFF"),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            border: Border.all(width: 1, color: Colors.grey)),
                        padding: const EdgeInsets.only(left: 0, right: 0),
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            padding: const EdgeInsets.only(left: 8, right: 0),
                            child: DropdownButton<CourseSub>(
                              hint: "Choose Course".text.make(),
                              dropdownColor: Colors.grey.shade300,
                              items: filteredData.map((CourseSub value) {
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
                              value: controller.seleectrdvalue33.value,
                              underline: Container(color: Colors.black),
                              isExpanded: true,
                              icon: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
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

                                controller.subjectList.addAll(
                                    newVal!.courseId!.exam!.subjects!.toList());
                                if (newVal != null) {
                                  //controller.selectedid.value =
                                  //    newVal.courseId!.id.toString();
                                  controller.selectedid.value =
                                      newVal.courseId!.exam!.id.toString();
                                  // Update the selected ID in the controller
                                  print(
                                      'Selected ID: ${controller.selectedid.value}');
                                  // Call API or perform actions with the selected value
                                  //controller.getProfile();
                                  controller.seleectrdvalue33.value = newVal;
                                }
                              },
                            ),
                          );
                        }),
                      ),
                    ).w(800),
                    20.heightBox,
                    //first dropdown
                    //Padding(
                    //  padding: const EdgeInsets.only(left: 25, right: 25),
                    //  child: Container(
                    //      height: 50,
                    //      //width: 300,
                    //      decoration: BoxDecoration(
                    //          color: HexColor("#F3FFFF"),
                    //          borderRadius:
                    //              const BorderRadius.all(Radius.circular(28)),
                    //          border: Border.all(width: 1, color: Colors.grey)),
                    //      padding: const EdgeInsets.only(left: 20, right: 0),
                    //      // alignment: Alignment.center,
                    //      child: Obx(() {
                    //        final filteredData = controller.courdata
                    //            .where((coursedetails) =>
                    //                coursedetails.purchased != "no" &&
                    //                coursedetails.courseType != "testSeries")
                    //            .toList();

                    //        return DropdownButton<Datum>(
                    //          hint: "Choose course".text.make(),
                    //          disabledHint: "Choose course".text.make(),
                    //          dropdownColor: Colors.grey.shade300,
                    //          items: filteredData.map((Datum profile) {
                    //            return DropdownMenuItem<Datum>(
                    //              value: profile,
                    //              child: Text(profile.title
                    //                  .toString()), // Replace with the appropriate field of your Profile class
                    //            );
                    //          }).toList(),
                    //          underline: Container(color: Colors.black),
                    //          isExpanded: true,
                    //          icon: Container(
                    //            clipBehavior: Clip.antiAliasWithSaveLayer,
                    //            alignment: Alignment.center,
                    //            height: 95,
                    //            width: 50,
                    //            decoration: BoxDecoration(
                    //                shape: BoxShape.circle,
                    //                gradient: buttonColor),
                    //            child: const Icon(
                    //              Icons.arrow_drop_down,
                    //              color: Colors.white,
                    //              size: 38,
                    //            ),
                    //          ),
                    //          value: controller.seleectrdvalue.value,
                    //          onChanged: (Datum? newValue) {
                    //            controller.subjectList.clear();

                    //            controller.subjectList
                    //                .addAll(newValue!.exam!.subjects!.toList());
                    //            if (newValue != null) {
                    //              controller.selectedid.value =
                    //                  newValue.exam!.id.toString();
                    //              // Update the selected ID in the controller
                    //              print(
                    //                  'Selected ID: ${controller.selectedid.value}');
                    //              // Call API or perform actions with the selected value

                    //            }
                    //            // Update the selected value in the controller
                    //            controller.seleectrdvalue.value = newValue;
                    //          },
                    //        );
                    //      })),
                    //).w(800),
                    //20.heightBox,
                    //seond dropdown
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: HexColor("#F3FFFF"),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(28)),
                              border: Border.all(width: 1, color: Colors.grey)),
                          padding: const EdgeInsets.only(left: 20, right: 0),
                          // alignment: Alignment.center,
                          child: Obx(
                            () => DropdownButton<String>(
                              dropdownColor: Colors.grey.shade300,
                              //disabledHint: "sss".text.make(),
                              hint: "Select Subject".text.make(),
                              items: controller.subjectList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }).toList(),
                              // menuMaxHeight: 10,
                              value: controller.seleectrdvalue3.value,

                              underline: Container(color: Colors.black),
                              isExpanded: true,
                              icon: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                alignment: Alignment.center,
                                height: 95,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: buttonColor),
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 248, 194, 194),
                                  size: 38,
                                ),
                              ),
                              onChanged: (newVal) {
                                if (newVal != null) {
                                  controller.selectedSubject.value =
                                      newVal.toString();
                                  // Update the selected ID in the controller
                                  print(
                                      'Selected Subjects: ${controller.seleectrdvalue3.value}');
                                  // Call API or perform actions with the selected value

                                  controller.getVideos();
                                }
                                controller.isVisible.value = true;
                                controller.seleectrdvalue3.value =
                                    newVal.toString();
                              },
                            ),
                          )),
                    ).w(800),

                    20.heightBox,
                    //buildvidios1(),
                    //Obx(() =>
                    //    Text(controller.vidiolistcorret.length.toString())),

                    Obx(() {
                      final isVisible = controller.isVisible.value;
                      final showPdf = controller.vidiolistcorret.value;

                      // Determine the height of the SizedBox based on isVisible and showPdf
                      double sizedBoxHeight = isVisible ? Get.height : 200;

                      return SizedBox(
                        height: sizedBoxHeight,
                        width: 800,
                        child: Container(
                          child: isVisible && showPdf.isEmpty
                              ? Center(
                                  child: CustomAlertBox(
                                    title: "No data found",
                                    message: "",
                                    onOkPressed: () {
                                      controller.isVisible.value = false;
                                    },
                                  ),
                                ).marginOnly(bottom: 380)
                              : isVisible
                                  ? buildvidios1()
                                  : Container(),
                        ),
                      );
                    }),
                  ]),
                ));
      }),
    ));
  }

  buildvidios1() {
    return Container(
            //height: 550,
            child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: controller.vidiolistcorret.length,
      itemBuilder: (context, index) {
        var playlist = controller.vidiolistcorret[index];

        return
            // controller.isLoading.isTrue
            //    ? BuildShimmer(
            //        child: Column(
            //          children: [
            //            buildSkeltion(),
            //            buildSkeltion(),
            //            buildSkeltion(),
            //            buildSkeltion(),
            //          ],
            //        ),
            //      )
            //    :
            Container(
          height: 150,
          padding: const EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            color: HexColor("#13407A"),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
                spreadRadius: 0.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //SizedBox(width: 20), // Use SizedBox instead of 20.heightBox
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text(
                  //  playlist.uploadId!.first.file!.url
                  //      .toString(),
                  //  style:
                  //      AppStyle.txtPoppinsSemiBold14White90002,
                  //  textAlign: TextAlign.justify,
                  //),
                  Text(
                    playlist.title.toString(),
                    style: AppStyle.txtPoppinsSemiBold14White90002,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      playlist.branch!.branch.toString(),
                      style: AppStyle.txtPoppinsMedium12White90002,
                      //textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis, // Handle overflow
                      maxLines: 4, // Limit the number of lines
                    ),
                  ),
                ],
              ).expand(),
              const SizedBox(width: 10),
              Stack(alignment: Alignment.center, children: [
                Container(
                  height: 110,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Opacity(
                    opacity: 0.4,

                    // Set the desired opacity value
                    child: Image.asset(
                      Assets.images.vidio.path,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    child: Container(
                        height: 35,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        )))
              ]).onTap(() {
                final url = playlist.uploadId!.first.file!.url;
                Get.toNamed(Routes.PLAY_VIDIO, arguments: url);
              }),
              30.heightBox
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 0),
        ).paddingSymmetric(horizontal: 25, vertical: 8).onTap(() {
          final url = playlist.uploadId!.first.file!.url;

          //    controller.vidiolist.first.uploadId?.first.file?.url;
          ////if (url != null) {
          Get.toNamed(Routes.PLAY_VIDIO, arguments: url);
        });
      },
    ).marginOnly(bottom: 0))
        .marginOnly(bottom: 310);
  }

  buildAppbar() {
    return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
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
