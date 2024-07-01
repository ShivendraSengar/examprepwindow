import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/referal_controller.dart';

class ReferalView extends GetView<ReferalController> {
  ReferalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final referralCode = controller.prefutils.getreferralcode();
    final shareText =
        "Hey there! Ready to dive into the world of learning with EPT? 📚 Use my referral code and get offers on your subscription! Let's empower our learning journey together!\nMy referral code is: $referralCode";

    return Scaffold(
      appBar: buildAppbar(),
      body: Obx(
        () => controller.isLoading.value
            ? BuildShimmer(
                child: Column(
                  children: [
                    buildSkeleton(),
                    buildSkeleton(),
                    buildSkeleton(),
                    buildSkeleton(),
                  ],
                ),
              )
            : Center(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(18.0),
                  width: 600,
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 4,
                      color: Vx.white,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10),
                            Image.asset(
                              Assets.images.referalImage.path,
                              height: 220,
                              width: 280,
                              fit: BoxFit.fill,
                            ),
                            Text("Refer And Get Exciting Offer Daily"),
                            20.heightBox,
                            Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 45,
                              decoration: BoxDecoration(
                                color: HexColor("f1f1f1"),
                                border: Border.all(
                                    width: 2, color: HexColor("f3f3f3")),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 45,
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 8),
                                      child: Text(
                                        referralCode!,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      gradient: horizontalGradient,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      controller.copied.value
                                          ? 'Copied'
                                          : 'Copy',
                                      style: TextStyle(color: Colors.white),
                                    )
                                        .box
                                        .make()
                                        .paddingSymmetric(horizontal: 0),
                                  ).onTap(() {
                                    copyText(referralCode!);
                                  }),
                                ],
                              ).box.roundedFull.make(),
                            ),
                            20.heightBox,
                            Container(
                              width: 120,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: horizontalGradient,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: const Text(
                                "invite now",
                                style: TextStyle(color: Colors.white),
                              ),
                            ).onTap(() {
                              Get.bottomSheet(
                                buildShareBottomSheet(
                                    context, shareText, referralCode),
                              );
                            }),
                            20.heightBox,
                          ],
                        ),
                      ),
                    ).w(699),
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildShareBottomSheet(
      BuildContext context, String shareText, String referralCode) {
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          20.heightBox,
          Text("Share this question to your friends"),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                buildShareOption(
                    Assets.images.gmail.path, () => _shareViaEmail(shareText)),
                15.widthBox,
                buildShareOption(Assets.images.telegram.path, () {
                  final text =
                      'Hey there! Ready to dive into the world of learning with EPT? 📚 Use my referral code $referralCode and get offers on your subscription! Let\'s empower our learning journey together!';
                  final telegramUrl =
                      'https://telegram.me/share/url?text=${Uri.encodeComponent(text)}';
                  _launchURL(telegramUrl);
                }),
                15.widthBox,
                buildShareOption(Assets.images.whatsapp.path, () async {
                  final String whatsappUrl =
                      "https://wa.me/?text=${Uri.encodeComponent(shareText)}";
                  _launchURL(whatsappUrl);
                }),
                15.widthBox,
                buildShareOption(Assets.images.messageBox.path, () {
                  _shareText(shareText);
                }),
                15.widthBox,
              ],
            ).w(300),
          ).expand(),
          Row(
            children: [
              SizedBox(height: 20),
              buildShareOption(Assets.images.linkedin.path, () {
                final text =
                    'Hey there! Ready to dive into the world of learning with EPT? 📚 Use my referral code and get offers on your subscription! Let\'s empower our learning journey together!\n My referral code is : $referralCode';
                final linkedInUrl =
                    'https://www.linkedin.com/sharing/share-offsite/?url=${Uri.encodeComponent(text)}';
                _launchURL(linkedInUrl);
              }),
              SizedBox(width: 20),
              buildShareOption(Assets.images.facebook.path, () {
                final text =
                    'Hey there! Ready to dive into the world of learning with EPT? 📚 Use my referral code and get offers on your subscription! Let\'s empower our learning journey together!\n My referral code is : $referralCode';
                final facebookUrl =
                    'https://www.facebook.com/sharer/sharer.php?u=${Uri.encodeComponent(text)}';
                _launchURL(facebookUrl);
              }),
            ],
          ).p(20),
        ],
      ),
    ).marginOnly(bottom: 20);
  }

  Widget buildShareOption(String assetPath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        assetPath,
        height: 45,
        width: 45,
        fit: BoxFit.fill,
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _shareText(String text) {
    Share.share(text);
  }

  void _shareViaEmail(String shareText) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: '',
      query: Uri.encodeQueryComponent(
        'subject=EPT Referral Code&body=$shareText',
      ),
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  void copyText(String referralCode) {
    Clipboard.setData(ClipboardData(text: referralCode));

    Get.snackbar(
      'Copied!',
      'Referral code copied to clipboard',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    controller.copied.value = true;
  }

  buildAppbar() {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Image.asset(
          Assets.images.headerLogo.path,
          height: 40,
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
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  Widget buildSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: 20.0,
        color: Colors.grey[300],
      ),
    );
  }
}
