import 'package:exam_prep_tool/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/widgets/watermark_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/play_vidio_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class PlayVidioView extends GetView<PlayVidioController> {
  const PlayVidioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Chewie Custom Controls Demo'),
      ),
      body: GestureDetector(
        onTap: () {
          controller.togglePlaycontrollerzsVisibility();
          print("Show valie${controller.showCustomControls.value}");
        },
        child: Container(
          //  color: Colors.grey.withOpacity(.4),

          child: Stack(children: [
            Chewie(
              controller: controller.chewieController,
            ),
            // Display a loader if the video is not yet ready to play
            if (controller.chewieController == null ||
                !controller.chewieController.videoPlayerController.value
                    .isInitialized ||
                controller
                    .chewieController.videoPlayerController.value.isBuffering)
              Center(
                child: CircularProgressIndicator(),
              ),
            GestureDetector(
              onTap: () async {
                // Telegram URL
                const String telegramUrl = 'https://t.me/+LnG8dEsFUnpiMDBl';

                // Check if the Telegram URL can be launched
                if (await canLaunch(telegramUrl)) {
                  // Launch the Telegram URL
                  await launch(telegramUrl);
                } else {
                  // If the URL can't be launched, show an error message
                  print('Could not launch Telegram URL');
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.telegram, color: Colors.grey),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.togglePlaybackSpeedOptionsVisibility();
                Get.back;
                // Use a boolean flag to toggle the visibility of the playback speed options container
              },
              child: const Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.more_vert))
                  .paddingOnly(right: 20),
            ),
            // Display the playback speed options container based on the visibility flag
            Obx(() {
              return Visibility(
                visible: controller.showPlaybackSpeedOptions.value,
                child: Positioned(
                  top: 20.0,
                  right: 20.0,
                  child: Container(
                    height: 150, // Adjust the height as needed
                    width: 100, // Adjust the width as needed
                    color: Colors.grey.shade500.withOpacity(.5),
                    child: Column(
                      children: controller.playbackSpeeds.map((speed) {
                        return Column(
                          children: [
                            Text(
                              speed.toString(),
                            ).p(5),
                          ],
                        ).onTap(() {
                          controller.setPlaybackSpeed(speed);
                          controller
                              .togglePlaybackSpeedOptionsVisibility(); // Hide the options container
                        });
                        //contentPadding: EdgeInsets.symmetric(vertical: -11),
                        //   title: Text(speed.toString()),
                        //   onTap: () {
                        //     controller.setPlaybackSpeed(speed);
                        //     controller.togglePlaybackSpeedOptionsVisibility(); // Hide the options container
                        //   },
                        // );
                      }).toList(),
                    ),
                  ),
                ),
              );
            }),
          ]),
        ),
      ),
    ));
  }
}
