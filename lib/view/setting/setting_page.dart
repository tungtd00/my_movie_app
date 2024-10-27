import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_movie_app/core/utils/dialog_rate.dart';



class SettingPage extends GetView {

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ct) {
        return DialogRate(
          ctx: context,
      
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Color(0xFF2970E4),
            fontFamily: "ComicSansMS",
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF2970E4)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () =>
                Get.toNamed(AppRouter.SET_LANGUAGE_PAGE, arguments: true),
            child: SettingItem(
              label: "Language options",
              leadingAsset: "assets/svg/language.svg",
              actionAsset: "assets/svg/arrow_forward_ios.svg",
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () async => await _launchPrivacyPolicyURL(),
            child: SettingItem(
              label: "Privacy policy",
              leadingAsset: "assets/svg/gpp_maybe.svg",
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () async =>
                await Share.share("https://pub.dev/packages/share_plus"),
            child: SettingItem(
              label: "Share",
              leadingAsset: "assets/svg/share.svg",
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () => _showImageDialog(context),
           
            child: SettingItem(
              label: "Rate",
              leadingAsset: "assets/svg/star_half.svg",
            ),
          ),
        ]),
      ),
    );
  }
}

_launchPrivacyPolicyURL() async {
  const url = 'https://nmhglobal.netlify.app/policy';
  Uri uri = Uri.parse(url); // Thay đổi đường link của bạn ở đây
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

class SettingItem extends StatelessWidget {
  String label;
  String leadingAsset;
  String? actionAsset;
  SettingItem(
      {super.key,
      required this.label,
      required this.leadingAsset,
      this.actionAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(leadingAsset),
              const SizedBox(
                width: 16,
              ),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF2970E4),
                  fontFamily: "ComicSansMS",
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          actionAsset == null
              ? Container()
              : Row(
                  children: [
                    SvgPicture.asset(actionAsset!),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
