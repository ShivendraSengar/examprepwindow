import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/resolve_doubtpage_controller.dart';

class ResolveDoubtpageView extends GetView<ResolveDoubtpageController> {
  const ResolveDoubtpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: lineargrdient),
        child: SafeArea(
            child: Scaffold(
                appBar: buildAppbar(),
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(gradient: lineargrdient),
                  child: Column(
                    children: [
                      100.heightBox,
                      Container(
                          width: 800,
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: cardcolor,
                            boxShadow: const [
                              BoxShadow(
                                color:
                                    Colors.black, // Set the shadow color here
                                blurRadius: 5.0, // Adjust the blur radius
                                spreadRadius: 0.0, // Adjust the spread radius
                                offset: Offset(0, 2), // Adjust the offset
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 60,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Vx.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    'CLOSE',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                              20.heightBox,
                              Image.asset(
                                Assets.images.resolveDoubts.path,
                                height: 120,
                                width: 100,
                              ),
                              40.heightBox,
                              buildCard("post difficult doubt".toUpperCase())
                                  .onTap(() {}),
                              25.heightBox,
                              buildCard("post urgent doubt".toUpperCase())
                                  .onTap(() {}),
                              60.heightBox,
                            ],
                          )),
                    ],
                  ),
                ))));
  }

  Widget buildCard(text) {
    return SizedBox(
      height: 60,
      width: 300,
      child: Card(
        // margin: const EdgeInsets.all(10),
        elevation: 3,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Vx.white),
          child: Text(
            text,
            style: AppStyle.txtPoppinsMedium14Gray90002,
          ),
        ),
      ),
    );
  }

  buildAppbar() {
    return AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
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
