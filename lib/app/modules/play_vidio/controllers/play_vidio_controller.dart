// import 'package:chewie/chewie.dart';

import 'dart:async';

import 'package:exam_prep_tool/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:exam_prep_tool/app/modules/play_vidio/views/custom_controllers.dart';

import 'package:exam_prep_tool/app/modules/play_vidio/views/play_vidio_view.dart';

import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/widgets/watermark_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:screen_protector/screen_protector.dart';

import 'package:video_player/video_player.dart';

class PlayVidioController extends GetxController {
  final PrefUtils foget = Get.find();

  final LoginScreenController logincontroller = Get.find();

  List<double> playbackSpeeds = [0.5, 1.0, 1.5, 2.0];

  late VideoPlayerController controller;
  var isInitialized = false.obs;
  var controlsVisible = true.obs;
  var volume = 1.0.obs;
  Timer? hideTimer;
  var previousVolume = 1.0;

  final videoUrl = Get.arguments;

  @override
  void onInit() {
    print("image${imageUrl + videoUrl}");
    super.onInit();
    controller = VideoPlayerController.network(imageUrl + videoUrl)
      ..addListener(() {
        update();
      })
      ..setLooping(true)
      ..initialize().then((_) {
        isInitialized.value = true;
        update();
      })
      ..play();
    startHideTimer();
  }

  @override
  void onClose() {
    controller.dispose();
    hideTimer?.cancel();
    super.onClose();
  }

  void startHideTimer() {
    hideTimer?.cancel();
    hideTimer = Timer(const Duration(seconds: 3), () {
      controlsVisible.value = false;
      update();
    });
  }

  void onTapVideo() {
    controlsVisible.value = !controlsVisible.value;
    if (controlsVisible.value) {
      startHideTimer();
    }

    update();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void setPlaybackSpeed(double speed) {
    // Set playback speed
    chewieController.videoPlayerController!.setPlaybackSpeed(speed);
  }
// static final VoidCallback videoPlayerListener = ()
//   {
  // ignore: unnecessary_null_comparison
  // if ((chewieController != null) && (videoPlayerController != null) && (chewieController.isFullScreen) && (videoPlayerController.value.position >= const Duration(seconds: 234))) {
  //     chewieController.exitFullScreen();
  //   }};

  void initializePlayer() {
    VideoPlayerController videoPlayerController =
        VideoPlayerController.network(imageUrl + playlist);
    //'https://devapi.exampreptool.com/api/';uploads/getFEFile/$playlist');
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,

      looping: false,
      showOptions: true,
      showControls: showCustomControls.value,
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
      showControlsOnInitialize: true,
      allowedScreenSleep: false,
      systemOverlaysAfterFullScreen: [
        SystemUiOverlay.top, // Show the status bar
        SystemUiOverlay.bottom, // Show the system navigation buttons
      ],
      systemOverlaysOnEnterFullScreen: [
        SystemUiOverlay.top, // Show the status bar
        SystemUiOverlay.bottom,
      ],
      progressIndicatorDelay: Duration(seconds: 3),
      allowPlaybackSpeedChanging: true,
      zoomAndPan: true,
      allowFullScreen: true,
      autoInitialize: true, // Automatically initialize Chewie
      aspectRatio: 16 / 9, // Set aspect ratio (e.g., 16:9)
      playbackSpeeds: playbackSpeeds,

      customControls: CustomControls(
        onFullScreenToggle: () {
          chewieController.enterFullScreen();
        },
        onSeekForward: () {
          seekForward();
        },
        onSeekBackward: () {
          seekBackward();
        },
        onPlayPauseToggle: () {
          chewieController.videoPlayerController.value.isPlaying
              ? chewieController.pause()
              : chewieController.play();
        },
        isPlaying: true,
        isFullScreen: false,
      ),

      overlay: Container(
        height: 700,
        width: 1500,
        child: Watarmark(
          title: logincontroller.email.text.toString() ?? "",
          rowCount: 2,
          columnCount: 2,
          text: foget.getMobile().toString() ?? "77777777",
        ),
      ),
    );
  }

  void seekForward() {
    final newPosition = chewieController.videoPlayerController.value.position +
        const Duration(seconds: 10);
    chewieController.videoPlayerController.seekTo(newPosition);
  }

  void seekBackward() {
    final newPosition = chewieController.videoPlayerController.value.position -
        const Duration(seconds: 10);
    chewieController.videoPlayerController.seekTo(newPosition);
  }
//   void startPlayback() {
//   chewieController.play();
//   hideCustomControls();
// }
}
