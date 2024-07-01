import 'dart:async';
// import 'dart:html' hide Platform;

import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_zoom_sdk/flutter_zoom_web.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/live_letcture_controller.dart';

class LiveLetctureView extends GetView<LiveLetctureController> {
  const LiveLetctureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _role = 0;
    late Timer timer;
    return DefaultTabController(
        length: 2,
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(gradient: lineargrdient),
            child: SafeArea(
                child: Scaffold(
                    appBar: buildAppbar(),
                    body: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(gradient: lineargrdient),
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: 800,
                            child: Column(
                              children: [
                                "Live Lectures"
                                    .toUpperCase()
                                    .text
                                    .textStyle(
                                        AppStyle.txtPoppinsSemiBold14White90002)
                                    .make(),
                                20.heightBox,
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, right: 25),
                                  child: Container(
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: HexColor("#F3FFFF"),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                    ),
                                    child: Obx(() {
                                      final filteredData = controller.userdetais
                                          .where((coursedetails) =>
                                              coursedetails.active == "yes")
                                          .toList();

                                      if (filteredData.isEmpty) {
                                        return const Center(
                                            child: Text("No active courses"));
                                      }

                                      if (filteredData.length == 1) {
                                        // Automatically select the only item and call the live controller
                                        WidgetsBinding.instance!
                                            .addPostFrameCallback((_) {
                                          controller.selectedid.value =
                                              filteredData.first.courseId!.id
                                                  .toString();
                                          controller.livrlectures();
                                        });
                                      }

                                      return DropdownButton<CourseSub>(
                                        hint: filteredData.length == 1
                                            ? Text(
                                                filteredData[0].name.toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            : Text("Choose Course"),
                                        //dropdownColor: Colors.grey.shade300,
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
                                        value:
                                            controller.seleectrdvalue33.value,
                                        underline: Container(
                                            color: Colors.transparent),
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
                                          if (newVal != null) {
                                            controller.selectedid.value =
                                                newVal.courseId!.id.toString();
                                            controller.livrlectures();
                                            controller.seleectrdvalue33.value =
                                                newVal;
                                          }
                                        },
                                      );
                                    }),
                                  ).w(800),
                                ),

                                // /////////////
                                //Padding(
                                //  padding: const EdgeInsets.only(
                                //      left: 25, right: 25),
                                //  child: Container(
                                //    height: 52,
                                //    decoration: BoxDecoration(
                                //      color: HexColor("#F3FFFF"),
                                //      borderRadius: BorderRadius.circular(25),
                                //      border: Border.all(
                                //          width: 1, color: Colors.grey),
                                //    ),
                                //    padding: const EdgeInsets.only(
                                //        left: 8, right: 0),
                                //    child: Obx(() {
                                //      final filteredData = controller.userdetais
                                //          .where((coursedetails) =>
                                //              coursedetails.active == "yes")
                                //          .toList();
                                //      return DropdownButton<CourseSub>(
                                //        hint: filteredData.length == 1
                                //            ? Text(
                                //                filteredData[0].name.toString(),
                                //                style: TextStyle(
                                //                  fontSize: 16,
                                //                  color: Colors.black,
                                //                  fontWeight: FontWeight.w500,
                                //                ),
                                //              )
                                //            : Text("Choose Course"),
                                //        dropdownColor: Colors.grey.shade300,
                                //        items:
                                //            filteredData.map((CourseSub value) {
                                //          return DropdownMenuItem<CourseSub>(
                                //            value: value,
                                //            child: Text(
                                //              value.name.toString(),
                                //              style: const TextStyle(
                                //                fontSize: 16,
                                //                color: Colors.black,
                                //                fontWeight: FontWeight.w500,
                                //              ),
                                //            ),
                                //          );
                                //        }).toList(),
                                //        value:
                                //            controller.seleectrdvalue33.value,
                                //        underline: Container(
                                //            color: Colors.transparent),
                                //        isExpanded: true,
                                //        icon: Container(
                                //          clipBehavior:
                                //              Clip.antiAliasWithSaveLayer,
                                //          alignment: Alignment.center,
                                //          height: 95,
                                //          width: 50,
                                //          decoration: BoxDecoration(
                                //            shape: BoxShape.circle,
                                //            gradient: buttonColor,
                                //          ),
                                //          child: const Icon(
                                //            Icons.arrow_drop_down,
                                //            color: Colors.white,
                                //            size: 38,
                                //          ),
                                //        ),
                                //        onChanged: (CourseSub? newVal) {
                                //          if (newVal != null) {
                                //            controller.selectedid.value =
                                //                newVal.courseId!.id.toString();
                                //            print(
                                //                'Selected ID: ${controller.selectedid.value}');
                                //            controller.livrlectures();
                                //            controller.seleectrdvalue33.value =
                                //                newVal;
                                //          }
                                //        },
                                //      );
                                //    }),
                                //  ),
                                //).w(800),

                                //// /////////////////////
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  width: 600,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0, color: Colors.white),
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Vx.white,
                                  ),
                                  child: TabBar(
                                    indicatorPadding: const EdgeInsets.all(0),
                                    labelPadding: const EdgeInsets.all(0),
                                    padding: const EdgeInsets.all(00),
                                    //indicatorWeight: 2.0,
                                    dividerHeight: 0,
                                    indicator: BoxDecoration(
                                      gradient: lineargrdient,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.black,
                                    tabs: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: const Tab(
                                          text: "Upcoming Lectures",
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: const Tab(
                                          text: "Live Lectures",
                                        ),
                                      ),
                                    ],
                                  ),
                                ).p(8).centered(),
                                const SizedBox(height: 20),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            // Text("fatata${controller.livelecture.length}"),
                                            ////////////////////////////////// upcomming lectures

                                            Obx(
                                              () {
                                                if (controller
                                                    .isLoading.isTrue) {
                                                  return BuildShimmer(
                                                    child: Column(
                                                      children: [
                                                        buildSkeltion(),
                                                        buildSkeltion(),
                                                        buildSkeltion(),
                                                        buildSkeltion(),
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  if (controller
                                                      .livelecture.isEmpty) {
                                                    // Show alert box when the list is empty
                                                    return AlertDialog(
                                                      title: Text("Empty List"),
                                                      content: Text(
                                                          "The list is empty."),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("OK"),
                                                        ),
                                                      ],
                                                    );
                                                  } else {
                                                    return Container(
                                                      height: Get.height,
                                                      child: ListView.builder(
                                                          itemCount: controller
                                                              .livelecture
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            var upcommimglist =
                                                                controller
                                                                        .livelecture[
                                                                    index];
                                                            return controller.formatTime(upcommimglist
                                                                        .timeData!
                                                                        .rawStartDate!
                                                                        .toDate()) ==
                                                                    null
                                                                ? Card(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Column(
                                                                          children: [
                                                                            // ignore: avoid_unnecessary_containers

                                                                            Container(
                                                                              child: Text('${upcommimglist.subject}'),
                                                                            ),
                                                                            //Text('${controller.formatTime(upcommimglist.timeData!.rawStartDate!.toDate())}'),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              9),
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                93,
                                                                                56,
                                                                                225),
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(8),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                alignment: Alignment.center,
                                                                                height: 35,
                                                                                width: 80,
                                                                                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
                                                                                padding: const EdgeInsets.all(5),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Image.asset(
                                                                                      Assets.images.liveIcons.path,
                                                                                      width: 70,
                                                                                      fit: BoxFit.cover,
                                                                                      height: 35,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Column(
                                                                                children: [
                                                                                  Text('${upcommimglist.title}'),
                                                                                  4.heightBox,
                                                                                  Text('${controller.formatDate(upcommimglist.timeData!.rawStartDate!.toDate())}'),
                                                                                  10.heightBox,
                                                                                  Container(
                                                                                    height: 35,
                                                                                    width: 120,
                                                                                    alignment: Alignment.center,
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: const BorderRadius.all(
                                                                                          Radius.circular(8),
                                                                                        ),
                                                                                        color: HexColor("#DC0000")),
                                                                                    child: Text("${upcommimglist.status}"),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                            .p(10)
                                                                            .expand(),
                                                                      ],
                                                                    ).p(10),
                                                                  ).p(5)
                                                                : SizedBox(
                                                                    child: Text(
                                                                        ""),
                                                                  );
                                                          }),
                                                    );
                                                  }
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      ////////////////////////////////////////////////////////////  live lectures
                                      ///
                                      ///
                                      Obx(
                                        () {
                                          if (controller.isLoading.isTrue) {
                                            // If loading, show shimmer effect
                                            return BuildShimmer(
                                              child: Column(
                                                children: [
                                                  buildSkeltion(),
                                                  buildSkeltion(),
                                                  buildSkeltion(),
                                                  buildSkeltion(),
                                                ],
                                              ),
                                            );
                                          } else {
                                            // Check if the data length is empty
                                            if (controller
                                                .livelecture.isEmpty) {
                                              // If data is empty, show an alert box
                                              WidgetsBinding.instance!
                                                  .addPostFrameCallback((_) {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text("No Data"),
                                                      content: Text(
                                                          "There is no data available."),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("OK"),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              });
                                              return Container(); // Returning an empty container since there's no data to display
                                            } else {
                                              // If data is available, display it in a ListView.builder
                                              return Container(
                                                height: Get.height,
                                                child: ListView.builder(
                                                    itemCount: controller
                                                        .livelecture.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      var upcommimglist =
                                                          controller
                                                                  .livelecture[
                                                              index];
                                                      return Card(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                //Container(
                                                                //  height: 10,
                                                                //  child:
                                                                //      TextField(
                                                                //    controller:
                                                                //        controller
                                                                //            .meetingid,
                                                                //  ),
                                                                //).expand(),

                                                                //Container(
                                                                //  height: 10,
                                                                //  child:
                                                                //      TextField(
                                                                //    controller:
                                                                //        controller
                                                                //            .password,
                                                                //  ),
                                                                //).expand(),
                                                                // ignore: avoid_unnecessary_containers

                                                                Container(
                                                                  child: Text(
                                                                      '${upcommimglist.subject}'),
                                                                ),
                                                                Text(controller.formatTime(
                                                                    upcommimglist
                                                                        .timeData!
                                                                        .rawStartDate!
                                                                        .toDate())),
                                                              ],
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(9),
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        93,
                                                                        56,
                                                                        225),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          8),
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: 35,
                                                                    width: 80,
                                                                    decoration: const BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(8))),
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            5),
                                                                    child: Row(
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          Assets
                                                                              .images
                                                                              .liveIcons
                                                                              .path,
                                                                          width:
                                                                              70,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          height:
                                                                              35,
                                                                        ),
                                                                        //Image.asset(Assets.images.liveIcons.path)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          '${upcommimglist.title}'),
                                                                      4.heightBox,
                                                                      Text(
                                                                          '${controller.formatDate(upcommimglist.timeData!.rawStartDate!.toDate())}'),
                                                                      10.heightBox,
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          print(
                                                                              "fffff");

                                                                          // joinMeetingWeb(
                                                                          //    context);
                                                                          // startMeetingWeb(
                                                                          //     context);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              35,
                                                                          width:
                                                                              120,
                                                                          alignment:
                                                                              Alignment.center,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: const BorderRadius.all(
                                                                                Radius.circular(8),
                                                                              ),
                                                                              color: HexColor("#DC0000")),
                                                                          child:
                                                                              Text("${upcommimglist.status}"),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ).p(10).expand(),
                                                          ],
                                                        ).p(10),
                                                      ).p(5);
                                                    }),
                                              );
                                            }
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))))));
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
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          // // Get.back();
          Get.back();
        },
      ),
    );
  }


  //API KEY & SECRET is required for below methods to work
  //Join Meeting With Meeting ID & Password
  // Modify joinMeeting function to accept meeting ID and password

//   joinMeetingWeb(BuildContext context) {
//     final String sdkKey = 'qbqgQd6gRiqpCU6F34uNag';
//     final String sdkSecret = "bD12VWuCDuoa6LerLRUj4h21KfR6yHu6";
//     ZoomOptions zoomOptions = ZoomOptions(
//         domain: "zoom.us",
//         appKey: sdkKey, //API KEY FROM ZOOM - Jwt API Key
//         appSecret: sdkSecret, //API SECRET FROM ZOOM - Jwt API Secret
//         //language: "en-US", // Optional - For Web

//         meetingInfo: const [
//           // Optional - For Web
//           'topic',
//           'host',
//           'mn',
//           'pwd',
//           'telPwd',
//           'invite',
//           'participant',
//           'dc',
//           'enctype',
//           'report'
//         ]);
//     var meetingOptions = new ZoomMeetingOptions(
//       userId:
//           'username', //pass username for join meeting only --- Any name eg:- EVILRATT.
//       meetingId: '81994516740', //Personal meeting id for start meeting required
//       meetingPassword:
//           '10751', //Personal meeting passcode for start meeting required
//       //To get personal meeting id and passcode follow https://zoom.us/meeting#/ and novigate to Personal Room tab
//     );

//     var zoom = ZoomViewWeb();
//     zoom.initZoom(zoomOptions).then((results) {
//       if (results[0] == 0) {
//         var zr = window.document.getElementById("zmmtg-root");
//         querySelector('body')?.append(zr!);
//         zoom.onMeetingStatus().listen((status) {
//           print("[Meeting Status Stream] : " + status[0] + " - " + status[1]);
//         });
//         final signature = zoom.generateSignature(zoomOptions.appKey.toString(),
//             zoomOptions.appSecret.toString(), '81994516740', 0);
//         meetingOptions.jwtAPIKey = zoomOptions.appKey.toString();
//         meetingOptions.jwtSignature = signature;
//         zoom.joinMeeting(meetingOptions).then((joinMeetingResult) {
//           zoom.startMeeting(meetingOptions).then((startMeetingResult) {
//             print("[Meeting Status Polling] : " +
//                 startMeetingResult[0] +
//                 " - " +
//                 startMeetingResult[1]);
//           });
//         }).catchError((error) {
//           print("[Error Generated] : " + error);
//         });
//       }
//     });
//   }

//   void startMeetingWeb(BuildContext context) {
//     // Replace these with your actual SDK Key and Secret
//     final String sdkKey = 'qbqgQd6gRiqpCU6F34uNag';
//     final String sdkSecret = "bD12VWuCDuoa6LerLRUj4h21KfR6yHu6";

//     ZoomOptions zoomOptions = ZoomOptions(
//       domain: "zoom.us",
//       appKey: sdkKey, // SDK Key
//       appSecret: sdkSecret, // SDK Secret
//       // Other options remain the same
//     );

//     var meetingOptions = ZoomMeetingOptions(
//         userId: '65fac6e749ae464362196f72',
//         meetingId: '81994516740',
//         meetingPassword: '10751',
//         displayName: "fffff",
//         disableTitlebar: "ayush"
//         // Other meeting options remain the same
//         );

//     var zoom = ZoomViewWeb();
//     zoom.initZoom(zoomOptions).then((results) {
//       if (results[0] == 0) {
//         var zr = window.document.getElementById("zmmtg-root");
//         querySelector('body')?.append(zr!);
//         zoom.onMeetingStatus().listen((status) {
//           print("[Meeting Status Stream] : " + status[0] + " - " + status[1]);
//         });
//         final signature = zoom.generateSignature(sdkKey, sdkSecret,
//             '81994516740', 1); // Generate signature using SDK key and secret
//         meetingOptions.jwtAPIKey = sdkKey;
//         meetingOptions.jwtSignature = signature;
//         zoom.startMeeting(meetingOptions).then((startMeetingResult) {
//           print("[Meeting Status Polling] : " +
//               startMeetingResult[0] +
//               " - " +
//               startMeetingResult[1]);
//         });
//       }
//     }).catchError((error) {
//       print("[Error Generated] : " + error);
//     });
//   }
// }
}