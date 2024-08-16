import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/modules/testsearis/views/practice_test_series.dart';
import 'package:exam_prep_tool/app/modules/testsearis/views/weekely_testSeries.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/testsearis_controller.dart';

import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
class TestsearisView extends GetView<TestsearisController> {
  const TestsearisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: lineargrdient),
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppbar(),
            body: Center(
              child: Container(
                height: Get.height,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    5.heightBox,
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 250.0,
                        autoPlay: false,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                      ),
                      items: controller.imgList.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(),
                              child: Image.network(imageUrl, fit: BoxFit.fill),
                            );
                          },
                        );
                      }).toList(),
                    ),
//   Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//     20.heightBox,
//     Container(
//       height: 52,
//       width: 350,
//       decoration: BoxDecoration(
//         color: HexColor("#F3FFFF"),
//         borderRadius: const BorderRadius.all(Radius.circular(25)),
//         border: Border.all(width: 1, color: Colors.grey),
//       ),
//       padding: const EdgeInsets.only(left: 0, right: 0),
//       child: Obx(() {
//         final filteredData = controller.userdetais
//             .where((coursedetails) => coursedetails.active == "yes")
//             .toList();

//         // Check if there is only one course, automatically select it
//         if (filteredData.length == 1 && controller.seleectrdvalue.value == null) {
//           controller.seleectrdvalue.value = filteredData[0];
//           controller.selectedid.value = filteredData[0].courseId!.exam!.id.toString();
//           controller.subjectList.clear();
//           controller.subjectList.addAll(filteredData[0].courseId!.exam!.subjects!.toList());
//         }

//         return DropdownButton<CourseSub>(
//           hint: "Choose Course".text.make(),
//           dropdownColor: Colors.grey.shade300,
//           items: filteredData.map((CourseSub value) {
//             return DropdownMenuItem<CourseSub>(
//               value: value,
//               child: Text(
//                 value.name.toString(),
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             );
//           }).toList(),
//           value: controller.seleectrdvalue.value,
//           underline: Container(color: Colors.black),
//           isExpanded: true,
//           icon: Container(
//             clipBehavior: Clip.antiAliasWithSaveLayer,
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
//             if (newVal != null) {
//               controller.subjectList.clear();
//               controller.subjectList.addAll(newVal.courseId!.exam!.subjects!.toList());
//               controller.selectedid.value = newVal.courseId!.exam!.id.toString();
//               controller.seleectrdvalue.value = newVal;
//             }
//           },
//         );
//       }),
//     ),
//     20.heightBox,
//     Container(
//       height: 52,
//       width: 350,
//       decoration: BoxDecoration(
//         color: HexColor("#F3FFFF"),
//         borderRadius: const BorderRadius.all(Radius.circular(25)),
//         border: Border.all(width: 1, color: Colors.grey),
//       ),
//       padding: const EdgeInsets.only(left: 18, right: 0),
//       child: Obx(() {
//         List<String> subjectListWithAll = ["All", ...controller.subjectList];

//         // Automatically select "All" by default if not already selected
//         if (controller.seleectrdvalue1.value == null || controller.seleectrdvalue1.value!.isEmpty) {
//           controller.seleectrdvalue1.value = "All";
//         }

//         return DropdownButton<String>(
//           hint: "Choose Subject".text.make(),
//           dropdownColor: Colors.grey.shade300,
//           items: subjectListWithAll.map((String subject) {
//             return DropdownMenuItem<String>(
//               value: subject,
//               child: Text(
//                 subject,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             );
//           }).toList(),
//           value: controller.seleectrdvalue1.value,
//           underline: Container(color: Colors.black),
//           isExpanded: true,
//           icon: Container(
//             clipBehavior: Clip.antiAliasWithSaveLayer,
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
//           onChanged: (newValue) {
//             if (newValue != null) {
//               controller.selectedSubject.value = newValue.toString();
//               controller.showpdfview();
//               controller.isVisible.value = true;
//               controller.seleectrdvalue1.value = newValue.toString();
//             }
//           },
//         );
//       }),
//     ),
//     20.heightBox,
//   ],
// ),

//                     Padding(
//             padding: const EdgeInsets.all(16.0),
//             child:DottedBorder(
//   color: Colors.deepOrange.shade500,
//  padding: EdgeInsets.all(16),
//   strokeWidth: 1,
 
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Warning:',
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   SizedBox(height: 8.0),
//                   Text(
//                     'Kindly refrain from engaging in any form of unauthorized actions like screen recording or screenshots unauthorized downloading as it may lead to legal complications.\n'
//                     'Don\'t share your account credentials to anyone because on every lecture screen your credentials will be there using those details. Legal action will be taken if any unauthorized action happened.',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ],
//               ),)),
                    30.heightBox,
 Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10),
                        width: 600,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(25.0),
                          color: Vx.white,
                        ),
                        child: TabBar(
                          controller: controller.tabController,
                          indicatorPadding: const EdgeInsets.all(0),
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          indicatorWeight: 2.0,
                          dividerHeight: 0,
                          indicator: BoxDecoration(
                            gradient: lineargrdient,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            _buildTab("Practice text", 0).w(200),
                            _buildTab("Weekly text", 1).w(200),
                            _buildTab("Live Test", 2).w(200),
                          ],
                        )).paddingSymmetric(vertical: 10).centered(),
                    10.heightBox,
                    Container(
                      height: Get.height - 250 - 75 - 45,
                      child: TabBarView(
                        
                        controller: controller.tabController,
                        children: [
                          PracticeTestSeries(),
                          WeeklyTest(),
                          buildButton("Weekly text", Vx.amber100),
                        ],
                      ),
                    ),
                    200.heightBox,
                  ],
                )),
              ),
            ),
          ),
        ),
      )
    );
  }
  

  Widget _buildTab(String text, int index) {
    return Obx(() {
      final selected = controller.tabIndex.value == index;
      Color unselectedColor;
      if (index == 0) {
        unselectedColor = Colors.orange;
      } else if (index == 1) {
        unselectedColor = Color.fromARGB(255, 40, 8, 247);
      } else {
        unselectedColor = Colors.green;
      }

      return Tab(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : unselectedColor,
            ),
          ),
        ),
      );
    });
  }

  buildButton(text, Color color) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      height: 30,
      color: color,
      child: Text(text),
    ).paddingSymmetric(horizontal: 20);
  }

  buildAppbar() {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            Assets.images.headerLogo.path,
            height: 40,
            width: 110,
            fit: BoxFit.contain,
          ),
          "Exam Prep Tool"
              .text
              .size(20)
              .textStyle(AppStyle.txtPoppinsSemiBold16White90002)
              .color(Vx.white)
              .make(),
        ],
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: lineargrdient),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Get.toNamed(Routes.HOME);
        },
      ),
    );
  }
}
