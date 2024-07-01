import 'package:exam_prep_tool/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/widgets/watermark_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/play_vidio_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomControls extends GetView<PlayVidioController> {
  final VoidCallback onFullScreenToggle;
  final VoidCallback onSeekForward;
  final VoidCallback onSeekBackward;
  final VoidCallback onPlayPauseToggle;
  final bool isPlaying;
  final bool isFullScreen;

  const CustomControls({
    required this.onFullScreenToggle,
    required this.onSeekForward,
    required this.onSeekBackward,
    required this.onPlayPauseToggle,
    required this.isPlaying,
    required this.isFullScreen,
  });

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController.of(context)!;
    return Obx(() => Visibility(
          visible: controller.showCustomControls.value,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                height: 95,
                width: double.infinity,
                color: Colors.black,
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // /  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: ChewieController.of(context)
                              .videoPlayerController,
                          builder: (_, VideoPlayerValue value, __) {
                            final position = value.position;
                            final duration = value.duration;

                            return Text(
                              '${position.inHours}:${position.inMinutes.remainder(60)}:${position.inSeconds.remainder(60)}',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Vx.white),
                            );
                          },
                        ),
                        40.widthBox,
                        ValueListenableBuilder(
                          valueListenable: ChewieController.of(context)
                              .videoPlayerController,
                          builder: (_, VideoPlayerValue value, __) {
                            final position = value.position;
                            final duration = value.duration;

                            return Text(
                                '${duration.inHours}:${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Vx.white));
                          },
                        ),

                        // Progress bar
                      ],
                    ).paddingOnly(left: 10, right: 10, bottom: 10),
                    // SizedBox(height: 10,
                    SizedBox(
                      height: 15,
                      child: ValueListenableBuilder(
                        valueListenable:
                            ChewieController.of(context).videoPlayerController,
                        builder: (_, VideoPlayerValue value, __) {
                          final position = value.position;
                          final duration = value.duration;

                          return Slider(
                            value: position.inMilliseconds.toDouble(),
                            min: 0.0,
                            max: duration.inMilliseconds.toDouble(),
                            onChanged: (value) {
                              final Duration newPosition =
                                  Duration(milliseconds: value.toInt());
                              chewieController.videoPlayerController
                                  .seekTo(newPosition);
                            },
                            activeColor:
                                Colors.blue, // Customize active color as needed
                            inactiveColor: Colors
                                .grey, // Customize inactive color as needed
                          );
                        },
                      ),
                    ),

                    Obx(() => Container(
                          // alignment: Alignment.topCenter,
                          height: 40,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: onSeekBackward,
                                    icon: Icon(Icons.fast_rewind,
                                        color: Vx.white, size: 16),
                                  ),
                                  SizedBox(width: 1),
                                  IconButton(
                                      onPressed: () {
                                        onPlayPauseToggle();
                                        controller.toggleCouponSection();
                                      },
                                      icon: Icon(
                                        controller.play.value
                                            ? Icons.play_arrow
                                            : Icons.pause,
                                        color: Vx.white,
                                        size: 16,
                                      )),
                                  IconButton(
                                    onPressed: onSeekForward,
                                    icon: Icon(Icons.fast_forward,
                                        color: Vx.white, size: 16),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Slider(
                                      value: controller.volume.value,
                                      min: 0.0,
                                      max: 1.0,
                                      onChanged: (value) {
                                        controller.setVolume(value);
                                      },
                                      activeColor: Colors.blue,
                                      inactiveColor: Colors.grey,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.toggleMute();
                                    },
                                    icon: Icon(
                                      controller.muted.value
                                          ? Icons.volume_off
                                          : Icons.volume_up,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ).p(0),

                              //
                              //IconButton(
                              //  onPressed: () async {
                              //    Future.delayed(Duration(seconds: 4), () {
                              //      controller.showCustomControls.value == true;
                              //    });

                              //    chewieController.toggleFullScreen();
                              //  },
                              //  icon: Icon(Icons.fullscreen,
                              //      color: Vx.white, size: 16),
                              //),
                              IconButton(
                                onPressed: () {
                                  final currentOrientation =
                                      MediaQuery.of(context).orientation;
                                  if (currentOrientation ==
                                      Orientation.portrait) {
                                    // Set landscape mode
                                    SystemChrome.setPreferredOrientations([
                                      DeviceOrientation.landscapeLeft,
                                      DeviceOrientation.landscapeRight,
                                    ]);
                                  } else {
                                    // Set portrait mode
                                    SystemChrome.setPreferredOrientations([
                                      DeviceOrientation.portraitUp,
                                      DeviceOrientation.portraitDown,
                                    ]);
                                  } //chewieController
                                  //    .systemOverlaysOnEnterFullScreen;
                                  //onFullScreenToggle();
                                  //chewieController.toggleFullScreen();
                                },
                                icon: Icon(controller.showCustomControls.value
                                    ? Icons.fullscreen_exit
                                    : Icons.fullscreen),
                              ),
                            ],
                          ).paddingOnly(left: 5, right: 5).w(500),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
