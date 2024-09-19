import 'dart:developer';

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
import '../controllers/twenypys_question_controller.dart';

class TwenypysQuestionView extends GetView<TwenypysQuestionController> {
  TwenypysQuestionView({Key? key}) : super(key: key);
  //final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  //final GlobalKey<SfPdfViewerState> _pdfViewerKey1 = GlobalKey();
  //List<String> subjectid = <String>[];

  //List<String> pdfview = <String>[];
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
                                  child: Column(children: [
                                    60.heightBox,
                                    //Text(controller.data.length.toString()),
                                    "20 years pyq’s with free  answer"
                                        .toUpperCase()
                                        .text
                                        .textStyle(AppStyle
                                            .txtPoppinsSemiBold14White90002)
                                        .make(),
                                    //Obx(() {
                                    //  // Use Obx widget to listen to changes in selectedIndex
                                    //  return Text(
                                    //    'Selected Index: ${controller.selectedIndex.value}',
                                    //    style: TextStyle(fontSize: 18),
                                    //  );
                                    //}),

                                    40.heightBox,
                                     Padding(
                                      padding: const EdgeInsets.only(
                                          left: 25, right: 25),
                                      child: Container(
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
                                               hint: "Choose Subject".text.make(),
                                               dropdownColor: Colors.grey.shade300,
                                               
                                               // Map subject name for the Dropdown
                                               items: controller.courdata1.map((SelectedSubjectlist subject) {
                                                 return DropdownMenuItem<String>(
                                                   value: subject.subject, // Use subject name as the value
                                                   child: Text(subject.subject ?? ""), // Display subject name
                                                 );
                                               }).toList(),
                                               
                                               value: controller.selectedValue.value, // Bind selected subject name
                                               
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
                                               
                                               onChanged: (String? newVal) {
                                                 // Find the full selected subject object by name
                                                 SelectedSubjectlist? selectedSubject = controller.courdata1
                                                     .firstWhereOrNull((subject) => subject.subject == newVal);
                                       
                                                 if (selectedSubject != null) {
                                                   // Store the selected subject name and the full object
                                                   controller.selectedValue.value = selectedSubject.subject;
                                                   controller.selectedSubject1.value = selectedSubject;
                                                   
                                                   // Print the selected subject details
                                                   print('Selected Subject Name: ${controller.selectedValue.value}');
                                                   // print('Selected Subject Details: ${controller.selectedSubject.value.id}');
                                                   
                                                   // Call a method or perform any action with the selected subject
                                                     controller.isVisible.value = true;
                                                   controller.showpdfview();
                                                 }
                                               },
                                             );
                                           })),
                                     ),
                                    
                                    
                                      20.heightBox,

                                    
                                  
                                    20.heightBox,

                                    Obx(() {
                                      final isVisible =
                                          controller.isVisible.value;
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
                                                          }),
                                                        );
                                                      },
                                                    ).paddingSymmetric(
                                                      horizontal: 10)
                                                  : Container(), // Empty container when isVisible is false
                                        ).paddingSymmetric(horizontal: 10),
                                      );
                                    }),
                                  ]),
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
                                  child: Column(children: [
                                    60.heightBox,
                                    //Text(controller.data.length.toString()),
                                    "20 years pyq’s with answer"
                                        .toUpperCase()
                                        .text
                                        .textStyle(AppStyle
                                            .txtPoppinsSemiBold14White90002)
                                        .make(),
                                    //Obx(() {
                                    //  // Use Obx widget to listen to changes in selectedIndex
                                    //  return Text(
                                    //    'Selected Index: ${controller.selectedIndex.value}',
                                    //    style: TextStyle(fontSize: 18),
                                    //  );
                                    //}),

                                    40.heightBox,
                                    // //first dropdown
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       left: 25, right: 25),
                                    //   child: Container(
                                    //     height: 52,
                                    //     width: 300,
                                    //     decoration: BoxDecoration(
                                    //         color: HexColor("#F3FFFF"),
                                    //         borderRadius:
                                    //             const BorderRadius.all(
                                    //                 Radius.circular(25)),
                                    //         border: Border.all(
                                    //             width: 1, color: Colors.grey)),
                                    //     padding: const EdgeInsets.only(
                                    //         left: 0, right: 0),
                                    //     // alignment: Alignment.center,
                                    //     child: Obx(() {
                                    //       final filteredData = controller
                                    //           .userdetais
                                    //           .where((coursedetails) =>
                                    //               coursedetails.active == "yes")
                                    //           .toList();
                                    //       return Container(
                                    //         height: 52,
                                    //         // width: 380,
                                    //         decoration: BoxDecoration(
                                    //           color: HexColor("#F3FFFF"),
                                    //           borderRadius:
                                    //               const BorderRadius.all(
                                    //                   Radius.circular(25)),
                                    //           border: Border.all(
                                    //               width: 1, color: Colors.grey),
                                    //         ),
                                    //         padding: const EdgeInsets.only(
                                    //             left: 8, right: 0),
                                    //         child: DropdownButton<CourseSub>(
                                    //           hint: "Choose Course".text.make(),
                                    //           dropdownColor:
                                    //               Colors.grey.shade300,
                                    //           items: filteredData
                                    //               .map((CourseSub value) {
                                    //             return DropdownMenuItem<
                                    //                 CourseSub>(
                                    //               value: value,
                                    //               child: Text(
                                    //                 value.name.toString(),
                                    //                 style: const TextStyle(
                                    //                   fontSize: 16,
                                    //                   color: Colors.black,
                                    //                   fontWeight:
                                    //                       FontWeight.w500,
                                    //                 ),
                                    //               ),
                                    //             );
                                    //           }).toList(),
                                    //           value: controller
                                    //               .seleectrdvalue.value,
                                    //           underline: Container(
                                    //               color: Colors.black),
                                    //           isExpanded: true,
                                    //           icon: Container(
                                    //             clipBehavior:
                                    //                 Clip.antiAliasWithSaveLayer,
                                    //             alignment: Alignment.center,
                                    //             height: 95,
                                    //             width: 50,
                                    //             decoration: BoxDecoration(
                                    //               shape: BoxShape.circle,
                                    //               gradient: buttonColor,
                                    //             ),
                                    //             child: const Icon(
                                    //               Icons.arrow_drop_down,
                                    //               color: Colors.white,
                                    //               size: 38,
                                    //             ),
                                    //           ),
                                    //           onChanged: (CourseSub? newVal) {
                                    //             controller.subjectList.clear();
                                    //             controller.subjectList.addAll(
                                    //                 newVal!.courseId!.exam!
                                    //                     .subjects!
                                    //                     .toList());
                                    //             if (newVal != null) {
                                    //               controller.selectedid.value =
                                    //                   newVal.courseId!.id
                                    //                       .toString();
                                    //               // Update the selected ID in the controller
                                    //               print(
                                    //                   'Selected ID: ${controller.selectedid.value}');
                                    //               // Call API or perform actions with the selected value
                                    //               //controller.getProfile();
                                    //               controller.seleectrdvalue
                                    //                   .value = newVal;
                                    //             }
                                    //           },
                                    //         ),
                                    //       );
                                    //     }),
                                    //   ),
                                    // ),
                                    // 20.heightBox,
                                    // //Text(subjectid.toString()),
                                    // Container(
                                    //     height: 52,
                                    //     width: 300,
                                    //     decoration: BoxDecoration(
                                    //         color: HexColor("#F3FFFF"),
                                    //         borderRadius:
                                    //             const BorderRadius.all(
                                    //                 Radius.circular(25)),
                                    //         border: Border.all(
                                    //             width: 1, color: Colors.grey)),
                                    //     padding: const EdgeInsets.only(
                                    //         left: 8, right: 0),
                                    //     // alignment: Alignment.center,
                                    //     child: Obx(
                                    //       () => DropdownButton<String>(
                                    //         hint: "Choose subject".text.make(),
                                    //         dropdownColor: Colors.grey.shade300,
                                    //         items: controller.subjectList
                                    //             .map((String subject) {
                                    //           return DropdownMenuItem<String>(
                                    //             value: subject,
                                    //             child: Text(
                                    //               subject,
                                    //               style: const TextStyle(
                                    //                 fontSize: 16,
                                    //                 color: Colors.black,
                                    //                 fontWeight: FontWeight.w500,
                                    //               ),
                                    //             ),
                                    //           );
                                    //         }).toList(),
                                    //         // menuMaxHeight: 10,
                                    //         value: controller
                                    //             .seleectrdvalue1.value,

                                    //         underline:
                                    //             Container(color: Colors.black),
                                    //         isExpanded: true,
                                    //         icon: Container(
                                    //           clipBehavior:
                                    //               Clip.antiAliasWithSaveLayer,
                                    //           alignment: Alignment.center,
                                    //           height: 95,
                                    //           width: 50,
                                    //           decoration: BoxDecoration(
                                    //               shape: BoxShape.circle,
                                    //               gradient: buttonColor),
                                    //           child: const Icon(
                                    //             Icons.arrow_drop_down,
                                    //             color: Colors.white,
                                    //             size: 38,
                                    //           ),
                                    //         ),
                                    //         onChanged: (newValue) {
                                    //           if (newValue != null) {
                                    //             controller
                                    //                     .selectedSubject.value =
                                    //                 newValue.toString();
                                    //             // Update the selected ID in the controller
                                    //             print(
                                    //                 'Selected Subjects: ${controller.selectedSubject.value}');
                                    //             // Call API or perform actions with the selected value
                                    //             //controller.getProfile();
                                    //             controller.showpdfview();

                                    //             //controller.getVideos();
                                    //             //controller.fetchData();
                                    //           }

                                    //           // Update the selected value in the controller
                                    //           //controller.seleectrdvalue.value = newValue;
                                    //           controller.seleectrdvalue1.value =
                                    //               newValue.toString();
                                    //           controller.isVisible.value = true;
                                    //         },
                                    //       ),
                                    //     )),
                                    // //Text(controller.showpdf.length.toString()),
Padding(
                                      padding: const EdgeInsets.only(
                                          left: 25, right: 25),
                                      child:
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
        hint: "Choose Subject".text.make(),
        dropdownColor: Colors.grey.shade300,
        
        // Map subject name for the Dropdown
        items: controller.courdata1.map((SelectedSubjectlist subject) {
          return DropdownMenuItem<String>(
            value: subject.subject, // Use subject name as the value
            child: Text(subject.subject ?? ""), // Display subject name
          );
        }).toList(),
        
        value: controller.selectedValue.value, // Bind selected subject name
        
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
        
        onChanged: (String? newVal) {
          // Find the full selected subject object by name
          SelectedSubjectlist? selectedSubject = controller.courdata1
              .firstWhereOrNull((subject) => subject.subject == newVal);

          if (selectedSubject != null) {
            // Store the selected subject name and the full object
            controller.selectedValue.value = selectedSubject.subject;
            controller.selectedSubject1.value = selectedSubject;
            
            // Print the selected subject details
            print('Selected Subject Name: ${controller.selectedValue.value}');
            // print('Selected Subject Details: ${controller.selectedSubject.value.id}');
            
            // Call a method or perform any action with the selected subject
              controller.isVisible.value = true;
            controller.showpdfview();
          }
        },
      );
    }))),
                                    
                                    
                                  
                                    20.heightBox,

                                    //Obx(
                                    //  () => Text(
                                    //      controller.showpdf.value.length.toString()),
                                    //),

                                    Obx(() {
                                      final isVisible =
                                          controller.isVisible.value;
                                      final showPdf = controller.showpdf.value;

                                      return SizedBox(width: 800,
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
                                                            //Get.toNamed(
                                                            final url = data
                                                                .uploadId!
                                                                .first
                                                                .file!
                                                                .url;
                                                            Get.toNamed(
                                                                Routes
                                                                    .SHOW_PDF_VIEW,
                                                                arguments: url);
                                                          }),
                                                        );
                                                      },
                                                    ).paddingSymmetric(
                                                      horizontal: 10)
                                                  : Container(), // Empty container when isVisible is false
                                        ).paddingSymmetric(horizontal: 10),
                                      );
                                    }),
                                  ]),
                                ));
                      }))));
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

  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Container(
            decoration: BoxDecoration(gradient: horizontalGradient),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.images.headerLogo.path,
                        height: 70,
                        width: 70,
                      ),
                      Text(
                        'Air-1 Test Series',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text(
                    'This Test Series made by GATE CSE AIR-1 AbhinavGarg,Total price will be Rs: 999, 3 Months Valid, Approx 100 tests will be there in PDF Format with solutions. ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Divider(thickness: 1, color: Colors.white),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        //controller.pickImageFromGallery();
                        Get.back();
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Container(
                        height: 50,
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.toNamed(Routes.AIR_TESTSERIES);
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.payment,
                            color: Colors.white,
                          ),
                          Text(
                            'Pay',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
