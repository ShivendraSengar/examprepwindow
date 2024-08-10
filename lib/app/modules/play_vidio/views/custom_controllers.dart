// import 'package:appinio_video_player/appinio_video_player.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       debugShowCheckedModeBanner: false,
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//       ),
//       title: 'Appinio Video Player Demo',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late VideoPlayerController _videoPlayerController;
//   late CustomVideoPlayerController _customVideoPlayerController;

//   final CustomVideoPlayerSettings _customVideoPlayerSettings =
//       const CustomVideoPlayerSettings(showFullscreenButton: true);

//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController = VideoPlayerController.network(
//       longVideo,
//     )..initialize().then((_) {
//         setState(() {});
//       });

//     _customVideoPlayerController = CustomVideoPlayerController(
//       context: context,
//       videoPlayerController: _videoPlayerController,
//       customVideoPlayerSettings: _customVideoPlayerSettings,
//     );
//   }

//   @override
//   void dispose() {
//     _customVideoPlayerController.dispose();
//     _videoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(
//         middle: Text("Appinio Video Player"),
//       ),
//       child: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: CustomVideoPlayer(
//                 customVideoPlayerController: _customVideoPlayerController,
//               ),
//             ),
//             CupertinoButton(
//               child: const Text("Play Fullscreen"),
//               onPressed: () {
//                 _customVideoPlayerController.setFullscreen(true);
//                 _customVideoPlayerController.videoPlayerController.play();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// String longVideo =
//     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
