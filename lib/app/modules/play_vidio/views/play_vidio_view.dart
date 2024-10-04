import 'dart:async';
import 'package:exam_prep_tool/app/modules/play_vidio/controllers/play_vidio_controller.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/watermark_page.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class PlayVidioView extends GetView<PlayVidioController> {
  const PlayVidioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final videoPlayerController = Get.put(VideoPlayerController());
    return Scaffold(
        appBar: buildAppbar(),
        body: Center(
          child: MaterialDesktopVideoControlsTheme(
            normal: MaterialDesktopVideoControlsThemeData(
              volumeBarActiveColor: Colors.blue,
              
              seekBarThumbColor: const Color.fromARGB(255, 139, 144, 149),
              seekBarPositionColor: Colors.blue,
              toggleFullscreenOnDoublePress: false,
              seekBarThumbSize: 1,
              seekBarHeight: 5,
              automaticallyImplySkipNextButton: true,
              topButtonBar: [
                MaterialDesktopCustomButton(
                  onPressed: () => _showSpeedDialog(context, controller),
                  icon: const Icon(Icons.speed),
                ),
                const Spacer(),
                MaterialDesktopCustomButton(
                  onPressed: () async {
                    const String telegramUrl = 'https://t.me/+LnG8dEsFUnpiMDBl';
                    if (await canLaunch(telegramUrl)) {
                      await launch(telegramUrl);
                    } else {
                      print('Could not launch Telegram URL');
                    }
                  },
                  icon:
                      const Icon(Icons.telegram, size: 30, color: Colors.blue),
                ),
              ],
              bottomButtonBar: [
                const MaterialDesktopPlayOrPauseButton(),
                MaterialDesktopCustomButton(
                  onPressed: controller.seekBackward,
                  icon: const Icon(Icons.replay_10),
                ),
                MaterialDesktopCustomButton(
                  onPressed: controller.seekForward,
                  icon: const Icon(Icons.forward_10),
                ),
                const MaterialDesktopVolumeButton(
                  volumeHighIcon: Icon(Icons.volume_up),
                  volumeLowIcon: Icon(Icons.volume_down),
                  volumeMuteIcon: Icon(Icons.volume_mute),
                  // onChanged: (value) => controller.changeVolume(value),
                ),
                const MaterialDesktopPositionIndicator(
                  style: TextStyle(color: Colors.white),
                  // position: player.state.position,
                  // duration: player.state.duration,
                ),
                const Spacer(),
                const MaterialDesktopFullscreenButton(),
              ],
            ),
            fullscreen: const MaterialDesktopVideoControlsThemeData(
              displaySeekBar: true,
              toggleFullscreenOnDoublePress: true,
              topButtonBarMargin: EdgeInsets.all(4),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Video(controller: controller.videoController),
                ),
                Container(
                      alignment: Alignment.center,
                    // top: 16.0,
                    // right: 16.0,
                    child: Watarmark(
                        rowCount: 2,
                        columnCount: 3,
                        title: controller.logincontroller.email.text.toString(),
                        text: controller.foget.getMobile().toString())
                    // Alternatively, you can use an image as a watermark
//
                    ),
              ],
            ),
          ),
          
        ));
  }

  void _showSpeedDialog(BuildContext context, controller) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Playback Speed'),
          content: Container(
            width: 300,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text('0.5x'),
                  onTap: () {
                    controller.changePlaybackSpeed(0.5);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('1.0x'),
                  onTap: () {
                    controller.changePlaybackSpeed(1.0);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('1.5x'),
                  onTap: () {
                    controller.changePlaybackSpeed(1.5);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('2.0x'),
                  onTap: () {
                    controller.changePlaybackSpeed(2.0);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  buildAppbar() {
    return AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
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
        ));
  }
}
