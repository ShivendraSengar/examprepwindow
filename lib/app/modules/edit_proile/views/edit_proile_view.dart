import 'dart:io';
import 'package:exam_prep_tool/app/modules/proile_page/views/curve_design.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/edit_proile_controller.dart';

class EditProileView extends GetView<EditProileController> {
  const EditProileView({Key? key}) : super(key: key);
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
                  // decoration: BoxDecoration(gradient: lineargrdient),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(color: HexColor("#1b4a86")),
                        ),
                        CustomPaint(
                          painter: CustomDesign(
                              backgroundColor: HexColor("#285998")),
                          size: Size.infinite,
                        ),
                        Container(
                          width: 800,
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  40.heightBox,
                                  Obx(
                                    () => controller.imagePath.value == ''
                                        ? Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 120,
                                                width: 120,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle),
                                                child: Image.asset(Assets.images
                                                    .profileImageBg.path),
                                              ),
                                              Positioned(
                                                bottom: -10,
                                                left: 80,
                                                // right: 0,
                                                child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 50,
                                                        width: 50,
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        decoration:
                                                            BoxDecoration(
                                                                gradient:
                                                                    buttonColor,
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Image.asset(
                                                                Assets
                                                                    .images
                                                                    .editImage
                                                                    .path)
                                                            .p(8))
                                                    .onTap(() {
                                                  _showDialog(context);
                                                }),
                                              )
                                            ],
                                          )
                                        : Container(
                                            alignment: Alignment.center,
                                            height: 120,
                                            width: 120,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.file(
                                              File(controller.imagePath.value),
                                              fit: BoxFit.cover,
                                              height: 100,
                                              width: 100,
                                            ).p(5),
                                          ).centered().p(5),
                                  ),
                                  30.heightBox,
                                  //Text(controller.profilrcontroller.editProfile
                                  //    .value.data!.studentId!.email
                                  //    .toString()),
                                  buildText(
                                    Icons.person,
                                    controller.getdata.profile?.studentId?.name,
                                    controller.name,
                                  ),
                                  buildText1(
                                      Icons.mail,
                                      controller
                                          .getdata.profile?.studentId?.email
                                          .toString()),
                                  //buildText(Icons.mail, " Abhay@yopmaolcom",
                                  //    controller.email),
                                  buildText1(
                                      Icons.call,
                                      controller
                                          .getdata.profile?.studentId?.mobile
                                          .toString()),
                                  //phonenumber(
                                  //  controller.phonenumber,
                                  //  controller.profilrcontroller.editProfile.value
                                  //      .data!.studentId!.mobile
                                  //      .toString(),
                                  //),
                                  buildText1(
                                      Icons.share,
                                      controller.getdata.profile?.branch
                                          .toString()),
                                  //buildText(
                                  //    Icons.share, " Branch", controller.branch),
                                  buildText(Icons.note_alt_outlined, " Subject",
                                      controller.subject),
                                  buildText(Icons.note_alt_outlined, " Exam",
                                      controller.exam),
                                  buildText(Icons.manage_history, " Language",
                                      controller.language),
                                  30.heightBox,
                                  Container(
                                    alignment: Alignment.center,
                                    width: 150,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors
                                                .black, // Set the shadow color here
                                            blurRadius:
                                                5.0, // Adjust the blur radius
                                            spreadRadius:
                                                0.0, // Adjust the spread radius
                                            offset: Offset(
                                                0, 2), // Adjust the offset
                                          ),
                                        ],
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30)),
                                        gradient:
                                            buttonColor), // Add your overlay color

                                    child: Text(' Save update '.toUpperCase(),
                                        style: AppStyle
                                            .txtPoppinsSemiBold14White90002),
                                  ).onTap(() {
                                    controller.updateProfile();
                                  }),
                                  30.heightBox
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ))));
  }

  Widget buildText1(IconData icon, text) {
    return Container(
        // padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        height: 45,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black, // Set the shadow color here
              blurRadius: 5.0, // Adjust the blur radius
              spreadRadius: 0.0, // Adjust the spread radius
              offset: Offset(1, 2), // Adjust the offset
            ),
          ],
        ),
        // shape: BoxShape.circle),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                color: HexColor("#13407A"),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              // margin: EdgeInsets.only(left: 4, right: 100),
              padding: const EdgeInsets.only(left: 10, right: 0),
              height: 90,
              width: 680,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: HexColor("#F3FEFF"),
              ),
              child: Text(
                text,
                style: AppStyle.txtPoppinsMedium14darkGray,
              ),
            ),
          ],
        )).paddingSymmetric(horizontal: 25, vertical: 10);
  }

  Widget phonenumber(controller, hinttext) {
    return Container(
        // padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        height: 40,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(
              color: Colors.black, // Set the shadow color here
              blurRadius: 5.0, // Adjust the blur radius
              spreadRadius: 0.0, // Adjust the spread radius
              offset: Offset(1, 2), // Adjust the offset
            ),
          ],
        ),
        // shape: BoxShape.circle),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    bottomLeft: Radius.circular(25)),
                color: HexColor("#13407A"),
              ),
              child: const Icon(
                Icons.phone,
                color: Colors.white,
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                // margin: EdgeInsets.only(left: 4, right: 100),
                padding: const EdgeInsets.only(left: 10, right: 100),
                height: 90,
                width: 680,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: HexColor("#F3FEFF"),
                ),
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: hinttext,
                      border: InputBorder.none),
                ))
          ],
        )).paddingSymmetric(horizontal: 25, vertical: 10);
  }

  Widget buildText(IconData icon, hinttext, controller) {
    return Container(
        // padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        height: 45,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black, // Set the shadow color here
              blurRadius: 5.0, // Adjust the blur radius
              spreadRadius: 0.0, // Adjust the spread radius
              offset: Offset(1, 2), // Adjust the offset
            ),
          ],
        ),
        // shape: BoxShape.circle),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                color: HexColor("#13407A"),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                // margin: EdgeInsets.only(left: 4, right: 100),
                padding: const EdgeInsets.only(left: 10, right: 100),
                height: 90,
                width: 680,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: HexColor("#F3FEFF"),
                ),
                child: buildTextField(controller, hinttext)),
          ],
        )).paddingSymmetric(horizontal: 25, vertical: 10);
  }

  Widget buildTextField(controller, hinttext) {
    return TextField(
      controller: controller,
      onChanged: (onchange) {},
      decoration: InputDecoration(hintText: hinttext, border: InputBorder.none),
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
          decoration: BoxDecoration(color: HexColor("#1b4a86")),
        ));
  }

  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Container(
            decoration: BoxDecoration(gradient: horizontalGradient),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text(
                    'Upload your picture from',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Divider(thickness: 1, color: Colors.white),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        controller.pickImageFromGallery();
                        Get.back();
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.camera_alt),
                          Text(
                            'Camera',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Container(
                        height: 50,
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        controller.pickImageFromGallery();
                        Get.back();
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.browse_gallery),
                          Text(
                            'Gallery',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
