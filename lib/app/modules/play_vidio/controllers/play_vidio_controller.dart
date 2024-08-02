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
}
