import 'package:exam_prep_tool/app/modules/terms_conditionscreen/views/terms_conditionscreen_view.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:io'; 
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/show_pdf_view_controller.dart';

class ShowPdfViewView extends GetView<ShowPdfViewController> {
  const ShowPdfViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


 

    return 
    

     Scaffold(
        appBar: buildAppbar(),
        body: GetBuilder<ShowPdfViewController>(
        init: ShowPdfViewController(),
        builder: (controller) {
          return RawKeyboardListener(
            focusNode: controller.focusNode,
            onKey: controller.handleKey,
            autofocus: true,
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Stack(
                  children: [
                    Center(
          child: Center(
            child: Obx(
              () => controller.isPdfLoaded.value
                  ? CircularProgressIndicator() // Show loading indicator
                  : SfPdfViewer.network(
                      'https://devapi.exampreptool.com/api/uploads/getFilepdf/${controller.pdf}',
                      controller: controller.pdfViewerController,
                    ),
            ),
          )),
                    if (controller.opacity == 0.0)
                      Center(
                        child: Text(
                          '',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                      ),
                    // Positioned(
                    //   bottom: 20,
                    //   left: 20,
                    //   child: Text(
                    //     'Blur: ${controller.blurr.floor()}  ${(controller.opacity * 100).floor()}%',
                    //     style: TextStyle(fontSize: 18),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
        
//         ));
//   }
// }
