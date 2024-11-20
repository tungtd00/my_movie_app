import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kTextTabBarHeight),
        child: Container(
          decoration: BoxDecoration(
            boxShadow:[
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Màu bóng (mờ 30%)
                offset: Offset(0, 4), // Bóng dọc xuống 4px
                blurRadius: 6.0,      // Độ mờ của bóng
              ),
            ],
          ),
          child: AppBar(
            title: const Text(
              "Settings",
              style: TextStyle(
                fontFamily: "ComicSansMS",
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),

            // iconTheme: const IconThemeData(color: Color(0xFF2970E4)),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(height: 16,),
          InkWell(
            onTap: () async => await _launchPrivacyPolicyURL(),
            child: SettingItem(
              label: "Privacy policy",
              leadingAsset: "assets/svg/gpp_maybe.svg",
              isDarkMode: Get.isDarkMode,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () async =>
                await Share.share("https://pub.dev/packages/share_plus"),
            child: SettingItem(
              label: 'share'.tr,
              leadingAsset: "assets/svg/share.svg",
              isDarkMode: Get.isDarkMode,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () => _showImageDialog(context),
           
            child: SettingItem(
              label: "Rate",
              leadingAsset: "assets/svg/star_half.svg",
              isDarkMode: Get.isDarkMode,
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
  bool isDarkMode;
  SettingItem(
      {super.key,
      required this.label,
      required this.leadingAsset,
      this.actionAsset,required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(12),
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: isDarkMode? Colors.black: Colors.grey[100],
      ),
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
                  // color: Color(0xFF2970E4),
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
