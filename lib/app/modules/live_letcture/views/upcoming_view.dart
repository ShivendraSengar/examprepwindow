import 'package:exam_prep_tool/app/modules/live_letcture/controllers/live_letcture_controller.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

class UpcommingliveLectures extends GetView<UpcommingliveLectures> {
  const UpcommingliveLectures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LiveLetctureController controller = Get.put(LiveLetctureController());

    return SingleChildScrollView(
      child: Column(
        children: [
          // Text("fatata${controller.vidiolist.length}"),
////////////////////////////////// upcomming lectures

          Obx(
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
                  : Container(
                      height: Get.height,
                      child: ListView.builder(
                        itemCount: controller.livelecture.length,
                        itemBuilder: (context, index) {
                          var upcomingList = controller.livelecture[index];
                          // Get the current date and time
                          DateTime currentDate = DateTime.now();
                          // Convert the rawStartDate to DateTime
                          DateTime? videoStartDate =
                              upcomingList.timeData!.rawStartDate!.toDate();
                          // Compare the current date and time with the video start date and time
                          if (currentDate.isAfter(videoStartDate!) ||
                              upcomingList.status == "live") {
                            // If current date and time is after video start date and time, return a SizedBox
                            return SizedBox(
                                // You can put your desired widget here
                                );
                          } else {
                            // If current date and time is not after video start date and time, return the Card
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    10.widthBox,
                                    Column(
                                      children: [
                                        Container(
                                          child:
                                              Text('${upcomingList.subject}'),
                                        ),
                                        //Text('${controller.formatTime(videoStartDate)}'),
                                      ],
                                    ),
                                    8.widthBox,
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 93, 56, 225),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 35,
                                            width: 80,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
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
                                              Text('${upcomingList.title}'),
                                              SizedBox(height: 4),
                                              //Text('${controller.formatDate(videoStartDate)}'),
                                              SizedBox(height: 10),
                                              Container(
                                                height: 35,
                                                width: 120,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                  color: HexColor("#DC0000"),
                                                ),
                                                child: Text(
                                                    "${upcomingList.status}"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}
