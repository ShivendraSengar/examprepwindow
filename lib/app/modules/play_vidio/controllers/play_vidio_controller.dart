import 'package:chewie/chewie.dart';

import 'package:exam_prep_tool/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:exam_prep_tool/app/modules/play_vidio/views/custom_controllers.dart';

import 'package:exam_prep_tool/app/modules/play_vidio/views/play_vidio_view.dart';
//import 'package:exam_prep_tool/app/modules/play_vidio/views/stfpaly.dart';

import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/widgets/watermark_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';

enum VideoQuality { low, medium, high }

class PlayVidioController extends GetxController {
  VideoPlayerController? vidioplayer;

  var play = false.obs;

  // Methods to toggle visibility

//   void screenon() async {
//     await ScreenProtector.preventScreenshotOn();
//   }

//   @override
//   void onInit() {
//     screenon();

//     super.onInit();

//     print("dddddd${imageUrl + playlist.toString()}");
//     // Assuming controller.playlist is a List<String> containing video URLs or paths
//     //String videoUrl = playlist.toString();

//     controllerss = VideoPlayerController.network(imageUrl + playlist);
//     controllerss?.initialize().then((_) {
//       update();
//     });
//     vidioplayer = VideoPlayerController.network(imageUrl + playlist);
//     vidioplayer?.initialize().then((_) {
//       update();
//     });
//   }
  final PrefUtils foget = Get.find();
  final email = Get.arguments;
  final playlist = Get.arguments;
  final LoginScreenController logincontroller = Get.find();

  late ChewieController chewieController;
  List<double> playbackSpeeds = [0.5, 1.0, 1.5, 2.0];

  final RxDouble volume = 1.0.obs; // Initialize volume to maximum
  final RxBool muted = false.obs;

  final RxBool showPlaybackSpeedOptions = false.obs;
  final RxBool showCustomControls = true.obs;

  static get videoPlayerController => null;

  void togglePlaycontrollerzsVisibility() {
    showCustomControls.value = !showCustomControls.value;

    // Wait for 4 seconds then set the value to false
    Future.delayed(const Duration(seconds: 4), () {
      hideCustomControls();
    });
  }

  void hideCustomControls() {
    showCustomControls.value = false;
  }

  // play back speed
  void togglePlaybackSpeedOptionsVisibility() {
    showPlaybackSpeedOptions.value = !showPlaybackSpeedOptions.value;
  }

  @override
  void onInit() {
    super.onInit();
    // setPlaybackSpeed(double speed)
    initializePlayer();
  }

  @override
  void onClose() {
    chewieController.pause();
    chewieController.dispose();
    super.onClose();
  }

  void toggleCouponSection() {
    play.value = !play.value;
  }

  void setVolume(double value) {
    volume.value = value;
    chewieController.videoPlayerController!.setVolume(value);
    if (value == 0.0) {
      // If volume is set to 0, mute the video
      muted.value = true;
    } else {
      muted.value = false;
    }
  }

  void toggleMute() {
    if (muted.value) {
      // If currently muted, unmute the video
      setVolume(1.0); // Set volume to maximum
    } else {
      // If not muted, mute the video
      setVolume(0.0); // Set volume to 0
    }
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
    //'https://exampreptool.com/api/';uploads/getFEFile/$playlist');
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
