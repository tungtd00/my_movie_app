import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/core/utils/constanst.dart';
import 'package:my_movie_app/shareController.dart';
import 'package:my_movie_app/view/splashPage/splashController.dart';





class Splash extends GetWidget {
  SplashController controller = Get.find();
  ShareController shareController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xFF04132C), // Set the background color of the splash screen
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.0,
                                3.0), // Start at the bottom of the screen
                            end: const Offset(
                                0.0, 0.0), // End at the top of the screen
                          ).animate(controller.animation),
                          child: MyWidget(), // Replace MyWidget with your custom widget
                        ),
                        const SizedBox(
                          height: AppValues.padding,
                        ),

                        Obx(
                          () => Visibility(
                            visible: controller.isViewNameApp.value,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 36),
                              child: Text(
                                "Xem phim online mọi lúc mọi nơi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF2970E4),
                                  fontFamily: "ComicSansMS",
                                  fontSize: 24,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Obx(() => Visibility(
                  visible: controller.isViewNav.value,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                      const SizedBox(
                        height: AppValues.padding,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: const Text(
                          "Chúc mọi người xem phim vui vẻ",
                          style: TextStyle(
                            color: Color(0xFF2970E4),
                            fontFamily: "ComicSansMS",
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                const SizedBox(
                  height: AppValues.padding * 2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget MyWidget() {
    return Container(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/image/logo.png",
          fit: BoxFit.fill,
        ));
  }
}
