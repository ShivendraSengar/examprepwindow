// import 'package:exam_prep_tool/app/modules/login_screen/controllers/login_screencontroller.dart';
// import 'package:exam_prep_tool/app/themes/app_style.dart';
// import 'package:exam_prep_tool/app/utils/const.dart';
// import 'package:exam_prep_tool/app/utils/pref_utis.dart';
// import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
// import 'package:exam_prep_tool/app/widgets/watermark_page.dart';
// import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'dart:async';

import 'package:exam_prep_tool/app/modules/play_vidio/controllers/play_vidio_controller.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/widgets/watermark_page.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:video_player/video_player.dart';

class PlayVidioView extends GetView<PlayVidioController> {
  const PlayVidioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: GetBuilder<PlayVidioController>(
        builder: (controller) {
          return controller.isInitialized.value
              ? AspectRatio(
                  aspectRatio: 18 / 9,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if (controller.controller.value.isPlaying) {
      controller.controller.pause();
    } else {
      controller.controller.play();
    }
    controller.onTapVideo();
                        },
                        child: VideoPlayer(controller.controller),
                      ),
                      // Watermark widget
                     Container(
                      alignment: Alignment.center,
                          // top: 16.0,
                          // right: 16.0,
                          child: Watarmark(
                              rowCount: 2,
                              columnCount: 3,
                              title: controller.logincontroller.email.text
                                  .toString(),
                              text: controller.foget.getMobile().toString())
                          // Alternatively, you can use an image as a watermark
//     
                          ),
                      if (controller.controlsVisible.value)
                        Container(
                          color: Colors.grey.withOpacity(0.7),
                          height: 90,
                          padding: EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              VideoProgressIndicator(controller.controller,
                                  allowScrubbing: true),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.replay_10,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        onPressed: () {
                                          controller.controller.seekTo(
                                              controller.controller.value
                                                      .position -
                                                  const Duration(seconds: 10));
                                          controller.startHideTimer();
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: IconButton(
                                        icon: Icon(
                                          controller.controller.value.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        onPressed: () {
                                          controller.controller.value.isPlaying
                                              ? controller.controller.pause()
                                              : controller.controller.play();
                                          controller.startHideTimer();
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.forward_10,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        onPressed: () {
                                          controller.controller.seekTo(
                                              controller.controller.value
                                                      .position +
                                                  const Duration(seconds: 10));
                                          controller.startHideTimer();
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        icon: Icon(
                                          controller.controller.value.volume > 0
                                              ? Icons.volume_up
                                              : Icons.volume_off,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        onPressed: () {
                                          double currentVolume =
                                              controller.volume.value;
                                          if (currentVolume > 0) {
                                            controller.previousVolume =
                                                currentVolume;
                                            controller.volume.value = 0.0;
                                          } else {
                                            controller.volume.value =
                                                controller.previousVolume;
                                          }
                                          controller.controller.setVolume(
                                              controller.volume.value);
                                          controller.startHideTimer();
                                        },
                                      ),
                                    ),
                                    Slider(
                                      value: controller.volume.value,
                                      min: 0.0,
                                      max: 1.0,
                                      onChanged: (value) {
                                        controller.volume.value = value;
                                        controller.controller
                                            .setVolume(controller.volume.value);
                                        controller.startHideTimer();
                                      },
                                      activeColor: Colors.white,
                                      inactiveColor: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                          
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.formatDuration(
                                          controller.controller.value.position),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      controller.formatDuration(
                                          controller.controller.value.duration),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      GestureDetector(
                        onTap: () async {
                          // Telegram URL
                          const String telegramUrl =
                              'https://t.me/+LnG8dEsFUnpiMDBl';

                          // Check if the Telegram URL can be launched
                          if (await canLaunch(telegramUrl)) {
                            // Launch the Telegram URL
                            await launch(telegramUrl);
                          } else {
                            // If the URL can't be launched, show an error message
                            print('Could not launch Telegram URL');
                          }
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.telegram,
                                color: Color.fromARGB(255, 47, 98, 225)),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: PopupMenuButton<double>(
                          initialValue:
                              controller.controller.value.playbackSpeed,
                          tooltip: 'Playback speed',
                          onSelected: (double speed) {
                            controller.controller.setPlaybackSpeed(speed);
                            controller.startHideTimer();
                          },
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuItem<double>>[
                              for (final double speed
                                  in controller.playbackSpeeds)
                                PopupMenuItem<double>(
                                  value: speed,
                                  child: Text(
                                    '${speed}x',
                                  ),
                                )
                            ];
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10,
                            ),
                            child: Container(
                                height: 30,
                                width: 45,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 0),
                                color: Colors.grey.shade300,
                                child: Text(
                                  '${controller.controller.value.playbackSpeed}x',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
