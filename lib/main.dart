import 'dart:async';

// import 'package:dio/dio.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/initial_bindings.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'app/data/app_apis/app_apis.dart';
import 'package:fvp/fvp.dart' as fvp;
import 'package:window_manager/window_manager.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
// Import the URL strategy setup file

// Uncomment and update the following if using Flutter web plugins
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
    fvp.registerWith();
    MediaKit.ensureInitialized();
    setUrlStrategy(PathUrlStrategy());
  // await windowManager.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();

  // Set URL strategy for web applications
  

  setupInterceptors();
  final myApiClient = AppApis(dio);

  // Define function to check token periodically
  void checkTokenPeriodically() {
    Timer.periodic(Duration(seconds: 10), (timer) async {
      try {
        // Make token check request
        await myApiClient.onedevicelogin(prefUtils.getToken().toString());
        print('Token is valid.'); // Log success
      } catch (e) {
        print('Error checking token: $e'); // Log error
      }
    });
  }

  // Uncomment and update the following if using Flutter web plugins
  // void registerPlugins(Registrar registrar) {
  //   ZoomViewWeb.registerWith(registrar);
  //   registrar.registerMessageHandler();
  // }

  // Run the GetX application
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBindings(),
    ),
  );

  // Start the periodic token check
  // checkTokenPeriodically();
}

