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
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

class WeeklyTest extends GetView<TestsearisController> {
  WeeklyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return  Obx(() {
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
      :
    LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        return

     SingleChildScrollView(
      child: Column(
        children: [
          // Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          //   20.heightBox,
          //   Container(
          //     height: 52,
          //     width: 350,
          //     decoration: BoxDecoration(
          //         color: HexColor("#F3FFFF"),
          //         borderRadius: const BorderRadius.all(Radius.circular(25)),
          //         border: Border.all(width: 1, color: Colors.grey)),
          //     padding: const EdgeInsets.only(left: 0, right: 0),
          //     // alignment: Alignment.center,
          //     child: Obx(() {
          //       final filteredData = controller.userdetais
          //           .where((coursedetails) => coursedetails.active == "yes")
          //           .toList();
          //       return Container(
          //         height: 52,
          //         // width: 380,
          //         decoration: BoxDecoration(
          //           color: HexColor("#F3FFFF"),
          //           borderRadius: const BorderRadius.all(Radius.circular(25)),
          //           border: Border.all(width: 1, color: Colors.grey),
          //         ),
          //         padding: const EdgeInsets.only(left: 18, right: 0),
          //         child: DropdownButton<CourseSub>(
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
          //             controller.subjectList.clear();
          //             controller.subjectList
          //                 .addAll(newVal!.courseId!.exam!.subjects!.toList());
          //             if (newVal != null) {
          //               controller.selectedid.value =
          //                   newVal.courseId!.exam!.id.toString();
          //               // Update the selected ID in the controller
          //               print('Selected ID: ${controller.selectedid.value}');
          //               // Call API or perform actions with the selected value
          //               //controller.getProfile();
          //               controller.seleectrdvalue.value = newVal;
          //             }
          //           },
          //         ),
          //       );
          //     }),
          //   ),
          //   20.heightBox,
          //   //Text(subjectid.toString()),
          //   Container(
          //       height: 52,
          //       width: 350,
          //       decoration: BoxDecoration(
          //           color: HexColor("#F3FFFF"),
          //           borderRadius: const BorderRadius.all(Radius.circular(25)),
          //           border: Border.all(width: 1, color: Colors.grey)),
          //       padding: const EdgeInsets.only(left: 18, right: 0),
          //       // alignment: Alignment.center,
          //       child: Obx(
          //         () => DropdownButton<String>(
          //           hint: "Choose subject".text.make(),
          //           dropdownColor: Colors.grey.shade300,
          //           items: controller.subjectList.map((String subject) {
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
          //           // menuMaxHeight: 10,
          //           value: controller.seleectrdvalue1.value,

          //           underline: Container(color: Colors.black),
          //           isExpanded: true,
          //           icon: Container(
          //             clipBehavior: Clip.antiAliasWithSaveLayer,
          //             alignment: Alignment.center,
          //             height: 95,
          //             width: 50,
          //             decoration: BoxDecoration(
          //                 shape: BoxShape.circle, gradient: buttonColor),
          //             child: const Icon(
          //               Icons.arrow_drop_down,
          //               color: Colors.white,
          //               size: 38,
          //             ),
          //           ),
          //           onChanged: (newValue) {
          //             if (newValue != null) {
          //               controller.selectedSubject.value = newValue.toString();
          //               // Update the selected ID in the controller
          //               print(
          //                   'Selected Subjects: ${controller.selectedSubject.value}');
          //               // Call API or perform actions with the selected value

          //               controller.weeklytest();

          //             }
          //             controller.isVisible.value = true;
          //             controller.seleectrdvalue1.value = newValue.toString();
          //           },
          //         ),
          //       )),
          //   //Text(controller.showpdf.length.toString()),
          // ]),
          // 20.heightBox,

          Row(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.selectedFilter.value = 'yes';
                  controller.filterTestSeries();
                },
                child: Text("Attempted"),
              ),
              18.widthBox,
              ElevatedButton(
                onPressed: () {
                  controller.selectedFilter.value = 'Not Attempted';
                  controller.filterTestSeries();
                },
                child: Text("Not Attempted"),
              ),
            ],
          ).paddingSymmetric(horizontal: 16, vertical: 10),

          Obx(() {
            return Container(
              //width: 300,
              height: Get.height,
              child: controller.selectedFilter.value == "yes"
                  ? selectTests(isSmallScreen)
                  : allTest(isSmallScreen),
            );
          }),
          //300.heightBox
      ],
      ) );
      },
    );});
  }

// bool showAttempted = true; // Toggle between true and false based on user action.

  Widget selectTests(bool isSmallScreen) {
    return Container(
      width: Get.width,
      height: 110,
      alignment: Alignment.topCenter,
      child: controller.filteredTestSeries.isEmpty
          ? CustomAlertBox(
              title: "No data found",
              message: "",
              onOkPressed: () {
                controller.isVisible.value = false;
              })
          : GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isSmallScreen ? 1 : 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 3 / 1.5,
              ),
              itemCount: controller.filteredTestSeries.length,
              itemBuilder: (context, index) {
                var data = controller.filteredTestSeries[index];
                return GestureDetector(
                  onTap: () {
                    bool isStarted = controller.testStates[index] ?? false;
                    controller.updateTestState(index, !isStarted);
                    Get.toNamed(
                      isStarted
                          ? Routes.TESTSERIES_VALUE_ANALYSIS
                          : Routes.TESTSERIES_INSTRUCTION,
                      arguments: data,
                    );
                  },
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                          spreadRadius: 0.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10.0),
                        Center(
                          child: Text(
                            data.testName.toString(),
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis,
                            ),
                            textAlign: TextAlign.center,
                          ).centered(),
                        ).paddingSymmetric(horizontal: 10).w(300).centered(),
                        8.heightBox,
                        Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.question_answer_sharp,
                                    color: Vx.gray200,
                                  ),
                                  2.widthBox,
                                  Text(
                                    "${data.questions!.length.toString()} ques",
                                    style: TextStyle(
                                      color: Vx.black,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 8.0),
                                child: VerticalDivider(
                                  width: .1,
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "${data.totalMarks.toString()} marks",
                                style: TextStyle(
                                  color: Vx.black,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 8.0,
                                ),
                                child: VerticalDivider(
                                  width: .1,
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              
                              Text(
                                "${data.timeData!.duration.toString()} mins ",
                                style: TextStyle(
                                  color: Vx.black,
                                ),
                              ),
                            ],
                          ).w(700),
                        ),
                        buildCard("${controller.formatDateTime(data.timeData!.rawStartDate.toString())}",
                                "Lang - English")
                            .w(700)
                            .p(8),
                        6.heightBox,
                        InkWell(
                          onTap: () {
                           print('Test Series ID: ${data.id}');
                           print('Test Series ID: $index');
                            controller.selectedFilter.value == "yes"
                                ? Get.toNamed(Routes.TESTSERIES_VALUE_ANALYSIS,
                                    arguments: [
                                        index,
                                        data.id,
                                      ]
                                    
                                      )
                                : Get.toNamed(
                                    Routes.TESTSERIES_INSTRUCTION,
                                    arguments: data,
                                  );

                            // bool isStarted = controller.selectedFilter.value == "yes";
                            // controller.updateTestState(index, !isStarted);
                            // Get.toNamed(
                            //   isStarted ? Routes.TESTSERIES_VALUE_ANALYSIS : Routes.TESTSERIES_INSTRUCTION,
                            //   arguments: data,
                            // );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: Colors.green,
                            ),
                            child: Text(
                              controller.selectedFilter.value == "yes"
                                  ? "View Analysis"
                                  : "Start",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ).paddingSymmetric(horizontal: 8),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 8),
                );
              },
            ),
    ).marginOnly(bottom: 0);
  }

///////////////////////////////////////////// all tests
  Widget allTest(bool isSmallScreen) {
    return Container(
      width: Get.width,
      height: 110,
      alignment: Alignment.topCenter,
      //color: const Color.fromARGB(255, 64, 214, 255),
      child: GridView.builder(
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isSmallScreen ? 1 : 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 3 / 1.5,
          ),
          itemCount: controller.testSeries.length,

          //padding: const EdgeInsets.only(bottom: 10),
          itemBuilder: (context, index) {
            var data = controller.testSeries[index];
            return Obx(
              () {
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
                    : GestureDetector(
                        onTap: () {
                          // Get.toNamed(
                          //   Routes.TESTSERIES_VALUE_ANALYSIS,
                          //   arguments: data,
                          // );
                        },
                        child: Container(
                          width: 350,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            //gradient: cardcolor,
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8.0),
                              Center(
                                child: Text(
                                  data.testName
                                      .toString(), // Adjust 'maxLength' to your desired character limit
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis),
                                  textAlign: TextAlign.center,
                                ).centered(),
                              )
                                  .paddingSymmetric(horizontal: 10)
                                  .w(300)
                                  .centered(),
                              8.heightBox,
                              Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.question_answer_sharp,
                                          color: Vx.gray200,
                                        ),
                                        2.widthBox,
                                        Text(
                                          "${data.questions!.length.toString()} ques",
                                          style: TextStyle(
                                            color: Vx.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 8.0),
                                      child: VerticalDivider(
                                        width: .1,
                                        thickness: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "${data.totalMarks.toString()} marks",
                                      style: TextStyle(
                                        color: Vx.black,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 8.0,
                                      ),
                                      child: VerticalDivider(
                                        width: .1,
                                        thickness: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "${data.timeData!.duration.toString()} mins ",
                                      style: TextStyle(
                                        color: Vx.black,
                                      ),
                                    ),
                                  ],
                                ).w(700),
                              ),
        
                               buildCard("${controller.formatDateTime(data.timeData!.rawStartDate.toString())}",
                                "Lang - English")
                                  .w(700)
                                  .p(8),
                              10.heightBox,
                              //////////////////////////////////////////////////////////////////////////////////////////////////////////
                              ////////////////////////

                              InkWell(
                                onTap: () {
                                  bool isStarted =
                                      controller.testStates[index] ?? false;
                                  controller.updateTestState(index, !isStarted);
                                  Get.toNamed(
                                    isStarted
                                        ? Routes.TESTSERIES_VALUE_ANALYSIS
                                        : Routes.TESTSERIES_INSTRUCTION,
                                    arguments: data,
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      color: Colors.green),
                                  child: Text(
                                    "Start",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ).paddingSymmetric(horizontal: 8),
                              ),
                            ],
                          ),
                        ).paddingSymmetric(horizontal: 8),
                      );
              },
            );
          }),
    ).marginOnly(bottom: 0);
  }

  Widget buildCard(text, textid) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.watch_later,
              color: Colors.grey.shade200,
            ),
            5.widthBox,
            Container(
              alignment: Alignment.center,
              // decoration: BoxDecoration(color: Vx.black),
              child: Text(
                text,
                style: AppStyle.txtPoppinsSemiBold14Black,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 8.0,
          ),
          child: VerticalDivider(
            width: .1,
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        //25.widthBox,
        Container(
          alignment: Alignment.center,
          //decoration: BoxDecoration(
          //    color: Color.fromARGB(255, 3, 179, 64),
          //    borderRadius: BorderRadius.circular(15)),
          child: Text(
            textid,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(
              color: Colors.black,
            ),

            //textAlign: TextAlign.justify,
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 15, vertical: 8);
  }
}
