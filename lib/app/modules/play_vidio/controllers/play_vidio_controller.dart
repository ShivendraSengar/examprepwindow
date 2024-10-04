import 'package:exam_prep_tool/app/modules/login_screen/controllers/login_screen_controller.dart';

import 'package:exam_prep_tool/app/utils/pref_utis.dart';

import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class PlayVidioController extends GetxController {
  final PrefUtils foget = Get.find();

  final LoginScreenController logincontroller = Get.find();

  final videoUrl = Get.arguments;

  // ///////////////////////////////////////////////////////////////
  /////////////////////////////for web player
  final player = Player();
  late final VideoController videoController;

  var playbackSpeed = 1.0.obs;
  var volume = 1.5.obs;
  var isFullScreen = false.obs;

  @override
  void onInit() {
    super.onInit();
    videoController = VideoController(player);
    player.open(Media(imageUrl + videoUrl));
    player.setVolume(volume.value);
  

// Set default volume to full or half
    volume.value = 1.0; // Full volume (for half, use 0.5)
    player.setVolume(volume.value);
  }

  void seekForward() {
    player.seek(player.state.position + Duration(seconds: 10));
  }

  void seekBackward() {
    player.seek(player.state.position - Duration(seconds: 10));
  }

  void changePlaybackSpeed(double speed) {
    playbackSpeed.value = speed;
    player.setRate(speed);
  }

  void changeVolume(double newVolume) {
    volume.value = newVolume;
    player.setVolume(newVolume);
  }

  void toggleFullScreen() {
    isFullScreen.value = !isFullScreen.value;
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
