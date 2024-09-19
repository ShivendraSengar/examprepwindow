//import 'package:exam_prep_tool/app/modules/air_notes/controllers/localization_model.dart';
import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';
import 'package:exam_prep_tool/app/data/modal/subjectfilterlist/subjectfilter.dart';

import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/get_exam_id.dart';
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

import '../controllers/air_notes_controller.dart';

class AirNotesView extends GetView<AirNotesController> {
  const AirNotesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: lineargrdient),
        child: SafeArea(
            child: Scaffold(
                appBar: buildAppbar(),
                body: controller.isTrue == true
                    ? Obx(() {
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
                                decoration:
                                    BoxDecoration(gradient: lineargrdient),
                                child: SingleChildScrollView(
                                  child: SizedBox(
                                    width: 800,
                                    child: Column(children: [
                                      60.heightBox,
                                      //Text(controller.courdata.length.toString()),
                                      //Text(controller.getfreecouse.length
                                      //    .toString()),
                                      "Air notes-1"
                                          .toUpperCase()
                                          .text
                                          .textStyle(AppStyle
                                              .txtPoppinsSemiBold14White90002)
                                          .make(),

                                      40.heightBox,
                                      Container(
                                          height: 52,
                                          width: 300,
                                          decoration: BoxDecoration(
                                              color: HexColor("#F3FFFF"),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(25)),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 0),
                                          // alignment: Alignment.center,
                                          child: Obx(() {
                                            // Loading indicator while data is being fetched
                                            if (controller.isLoading.value) {
                                              return CircularProgressIndicator();
                                            }

                                            // DropdownButton to display the data
                                            return DropdownButton<String>(
                                              hint:
                                                  "Choose Subject".text.make(),
                                              dropdownColor:
                                                  Colors.grey.shade300,

                                              // Map subject name for the Dropdown
                                              items: controller.courdata1.map(
                                                  (SelectedSubjectlist
                                                      subject) {
                                                return DropdownMenuItem<String>(
                                                  value: subject
                                                      .subject, // Use subject name as the value
                                                  child: Text(subject.subject ??
                                                      ""), // Display subject name
                                                );
                                              }).toList(),

                                              value: controller.selectedValue
                                                  .value, // Bind selected subject name

                                              underline: Container(
                                                  color: Colors.black),
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

                                              onChanged: (String? newVal) {
                                                // Find the full selected subject object by name
                                                SelectedSubjectlist?
                                                    selectedSubject = controller
                                                        .courdata1
                                                        .firstWhereOrNull(
                                                            (subject) =>
                                                                subject
                                                                    .subject ==
                                                                newVal);

                                                if (selectedSubject != null) {
                                                  // Store the selected subject name and the full object
                                                  controller
                                                          .selectedValue.value =
                                                      selectedSubject.subject;
                                                  controller.selectedSubject1
                                                      .value = selectedSubject;

                                                  // Print the selected subject details
                                                  print(
                                                      'Selected Subject Name: ${controller.selectedValue.value}');
                                                  // print('Selected Subject Details: ${controller.selectedSubject.value.id}');

                                                  // Call a method or perform any action with the selected subject
                                                  controller.showpdfview();
                                                  controller.isVisible.value =
                                                      true;
                                                }
                                              },
                                            );
                                          })),

                                      20.heightBox,
//                                Container(
//   height: 52,
//   width: 300,
//   decoration: BoxDecoration(
//       color: HexColor("#F3FFFF"),
//       borderRadius: const BorderRadius.all(Radius.circular(25)),
//       border: Border.all(width: 1, color: Colors.grey)),
//   padding: const EdgeInsets.only(left: 8, right: 0),
//   child: Obx(
//     () => DropdownButton<String>(
//       hint: "Choose subject".text.make(),
//       dropdownColor: Colors.grey.shade300,
//       items: controller.subjectList.map((String subject) {
//         return DropdownMenuItem<String>(
//           value: subject,
//           child: Text(
//             subject,
//             style: const TextStyle(
//               fontSize: 16,
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         );
//       }).toList(),
//       value: controller.seleectrdvalu4.value,
//       underline: Container(color: Colors.black),
//       isExpanded: true,
//       icon: Container(
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         alignment: Alignment.center,
//         height: 95,
//         width: 50,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           gradient: buttonColor,
//         ),
//         child: const Icon(
//           Icons.arrow_drop_down,
//           color: Colors.white,
//           size: 38,
//         ),
//       ),
//       onChanged: (newValue) {
//         if (newValue != null) {
//           controller.selectedSubject.value = newValue.toString();
//           print('Selected Subjects: ${controller.selectedSubject.value}');
//           // Fetch or display content related to selected subject
//           controller.showpdfview();
//         }
//         controller.isVisible.value = true;
//         controller.seleectrdvalu4.value = newValue.toString();
//       },
//     ),
//   ),
// ),

                                      Obx(() {
                                        final isVisible =
                                            controller.isVisible.value;
                                        final showPdf =
                                            controller.showpdf.value;

                                        return SizedBox(
                                          width: 800,
                                          height: isVisible ? 220 : 200,
                                          child: Container(
                                                  child: isVisible &&
                                                          showPdf.isEmpty
                                                      ? CustomAlertBox(
                                                          title:
                                                              "No data found",
                                                          message: "",
                                                          onOkPressed: () {
                                                            controller.isVisible
                                                                .value = false;
                                                          })
                                                      : ListView.builder(
                                                          itemCount:
                                                              showPdf.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            var data =
                                                                showPdf[index];

                                                            return SizedBox(
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    data.title
                                                                            .toString() ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ).expand(),
                                                                  Image.asset(
                                                                    Assets
                                                                        .images
                                                                        .eye
                                                                        .path,
                                                                    height: 25,
                                                                    width: 25,
                                                                  )
                                                                ],
                                                              ).onTap(() {
                                                                final url = data
                                                                    .uploadId!
                                                                    .first
                                                                    .file!
                                                                    .url;
                                                                Get.toNamed(
                                                                    Routes
                                                                        .SHOW_PDF_VIEW,
                                                                    arguments:
                                                                        url);
                                                              }),
                                                            );
                                                          },
                                                        ).paddingSymmetric(
                                                          horizontal: 10)
                                                  // Empty container when isVisible is false
                                                  )
                                              .paddingSymmetric(horizontal: 10),
                                        );
                                      }),
                                    ]),
                                  ),
                                ));
                      })
                    : Obx(() {
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
                                decoration:
                                    BoxDecoration(gradient: lineargrdient),
                                child: SingleChildScrollView(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 800,
                                    child: Column(children: [
                                      60.heightBox,

                                      "Air notes"
                                          .toUpperCase()
                                          .text
                                          .textStyle(AppStyle
                                              .txtPoppinsSemiBold14White90002)
                                          .make(),

                                      40.heightBox,
                                      Container(
                                          height: 52,
                                          width: 300,
                                          decoration: BoxDecoration(
                                              color: HexColor("#F3FFFF"),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(25)),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 0),
                                          // alignment: Alignment.center,
                                          child: Obx(() {
                                            // Loading indicator while data is being fetched
                                            if (controller.isLoading.value) {
                                              return CircularProgressIndicator();
                                            }

                                            // DropdownButton to display the data
                                            return DropdownButton<String>(
                                              hint:
                                                  "Choose Subject".text.make(),
                                              dropdownColor:
                                                  Colors.grey.shade300,

                                              // Map subject name for the Dropdown
                                              items: controller.courdata1.map(
                                                  (SelectedSubjectlist
                                                      subject) {
                                                return DropdownMenuItem<String>(
                                                  value: subject
                                                      .subject, // Use subject name as the value
                                                  child: Text(subject.subject ??
                                                      ""), // Display subject name
                                                );
                                              }).toList(),

                                              value: controller.selectedValue
                                                  .value, // Bind selected subject name

                                              underline: Container(
                                                  color: Colors.black),
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

                                              onChanged: (String? newVal) {
                                                // Find the full selected subject object by name
                                                SelectedSubjectlist?
                                                    selectedSubject = controller
                                                        .courdata1
                                                        .firstWhereOrNull(
                                                            (subject) =>
                                                                subject
                                                                    .subject ==
                                                                newVal);

                                                if (selectedSubject != null) {
                                                  // Store the selected subject name and the full object
                                                  controller
                                                          .selectedValue.value =
                                                      selectedSubject.subject;
                                                  controller.selectedSubject1
                                                      .value = selectedSubject;

                                                  // Print the selected subject details
                                                  print(
                                                      'Selected Subject Name: ${controller.selectedValue.value}');
                                                  // print('Selected Subject Details: ${controller.selectedSubject.value.id}');

                                                  // Call a method or perform any action with the selected subject
                                                  controller.isVisible.value = true;
                                                  controller.showpdfview();
                                                }
                                              },
                                            );
                                          })),

                                      20.heightBox,
// Container(
//   height: 52,
//   width: 300,
//   decoration: BoxDecoration(
//     color: HexColor("#F3FFFF"),
//     borderRadius: const BorderRadius.all(Radius.circular(25)),
//     border: Border.all(width: 1, color: Colors.grey),
//   ),
//   padding: const EdgeInsets.only(left: 0, right: 0),
//   child: Obx(() {
//     final filteredData = controller.userdetais
//         .where((coursedetails) => coursedetails.active == "yes")
//         .toList();

//     // Use Future.microtask to defer state change until after the build phase
//     Future.microtask(() {
//       if (filteredData.isNotEmpty && controller.seleectrdvalue.value == null) {
//         // Automatically select the first item (index 0)
//         controller.seleectrdvalue.value = filteredData.first;
//         controller.subjectList.clear();
//         controller.subjectList.addAll(filteredData.first.courseId!.exam!.subjects!.toList());
//         controller.selectedid.value = filteredData.first.courseId!.exam!.id.toString();
//       }
//     });

//     return Container(
//       height: 52,
//       decoration: BoxDecoration(
//         color: HexColor("#F3FFFF"),
//         borderRadius: const BorderRadius.all(Radius.circular(25)),
//         border: Border.all(width: 1, color: Colors.grey),
//       ),
//       padding: const EdgeInsets.only(left: 8, right: 0),
//       child: DropdownButton<CourseSub>(
//         hint: "Choose Course".text.make(),
//         dropdownColor: Colors.grey.shade300,
//         items: filteredData.map((CourseSub value) {
//           return DropdownMenuItem<CourseSub>(
//             value: value,
//             child: Text(
//               value.name.toString(),
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           );
//         }).toList(),
//         value: controller.seleectrdvalue.value,
//         underline: Container(color: Colors.black),
//         isExpanded: true,
//         icon: Container(
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           alignment: Alignment.center,
//           height: 95,
//           width: 50,
//           decoration: BoxDecoration(shape: BoxShape.circle, gradient: buttonColor),
//           child: const Icon(Icons.arrow_drop_down, color: Colors.white, size: 38),
//         ),
//         onChanged: (CourseSub? newVal) {
//           if (newVal != null) {
//             controller.subjectList.clear();
//             controller.subjectList.addAll(newVal.courseId!.exam!.subjects!.toList());
//             controller.selectedid.value = newVal.courseId!.exam!.id.toString();
//             controller.seleectrdvalue.value = newVal;
//             print('Selected ID: ${controller.selectedid.value}');
//           }
//         },
//       ),
//     );
//   }),
// ),
// 20.heightBox,

//                                       //Text(subjectid.toString()),
//                                       Container(
//                                           height: 52,
//                                           width: 300,
//                                           decoration: BoxDecoration(
//                                               color: HexColor("#F3FFFF"),
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(25)),
//                                               border: Border.all(
//                                                   width: 1,
//                                                   color: Colors.grey)),
//                                           padding: const EdgeInsets.only(
//                                               left: 8, right: 0),
//                                           // alignment: Alignment.center,
//                                           child: Obx(() {
//   return DropdownButton<String>(
//     hint: "Choose Subject".text.make(),
//     dropdownColor: Colors.grey.shade300,

//     // Dropdown items (map subject.name to DropdownMenuItem value)
//     items: controller.courdata1.map((SelectedSubjectlist subject) {
//       return DropdownMenuItem<String>(
//         value: subject.subject, // Bind subject name instead of ID
//         child: Text(subject.subject ?? ""), // Display subject name
//       );
//     }).toList(),

//     value: controller.selectedValue.value, // Bind the selected subject name

//     underline: Container(color: Colors.black),
//     isExpanded: true,

//     icon: Container(
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       alignment: Alignment.center,
//       height: 95,
//       width: 50,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         gradient: buttonColor,
//       ),
//       child: const Icon(
//         Icons.arrow_drop_down,
//         color: Colors.white,
//         size: 38,
//       ),
//     ),

//     onChanged: (String? newVal) {
//       // Clear the subject list
//       controller.subjectList.clear();

//       // Update selectedValue with the subject name
//       controller.selectedValue.value = newVal;

//       // // Update selectedSubject with the selected name
//       // controller.selectedSubject.value = newVal.toString();

//       // // Print the selected subject name
//       // print('Selected Subject: ${controller.selectedSubject.value}');

//       // Fetch or display content related to the selected subject
//       controller.showpdfview();
//     },
//   );})),

//                                       //    controller.showpdf.length.toString()),
//                                       20.heightBox,

                                      Obx(() {
                                        final isVisible =
                                            controller.isVisible.value;
                                        final showPdf =
                                            controller.showpdf.value;

                                        return SizedBox(
                                          width: 800,
                                          height: isVisible ? 300 : 200,
                                          child: Container(
                                            child: isVisible && showPdf.isEmpty
                                                ? CustomAlertBox(
                                                    title: "No data found",
                                                    message: "",
                                                    onOkPressed: () {
                                                      controller.isVisible
                                                          .value = false;
                                                    })
                                                : isVisible
                                                    ? ListView.builder(
                                                        itemCount:
                                                            showPdf.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data =
                                                              showPdf[index];

                                                          return SizedBox(
                                                              child: Row(
                                                            children: [
                                                              Text(
                                                                data.title
                                                                        .toString() ??
                                                                    "",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ).expand(),
                                                              Image.asset(
                                                                Assets.images
                                                                    .eye.path,
                                                                height: 25,
                                                                width: 25,
                                                              )
                                                            ],
                                                          ).onTap(() {
                                                            final url = data
                                                                .uploadId!
                                                                .first
                                                                .file!
                                                                .url;
                                                            Get.toNamed(
                                                                Routes
                                                                    .SHOW_PDF_VIEW,
                                                                arguments: url);
                                                          }));
                                                        },
                                                      ).paddingSymmetric(
                                                        horizontal: 10)
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
            //Get.toNamed(Routes.HOME);
            //// // Get.back();
            Get.back();
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
