import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/src/features/controllers/splash_screen_controller.dart';
import 'package:login_app/src/features/screens/welcome_screen.dart';

import '../../constants/colors.dart';
import '../../constants/image_strings.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Obx(
            () => AnimatedPositioned(
                duration: Duration(milliseconds: 1600),
                top: splashController.animate.value ? 0 : -30,
                left: splashController.animate.value ? 0 : -30,
                child: Container(
                    width: VASplashContainerSize * 3,
                    height: VASplashContainerSize * 3.11,
                    decoration: BoxDecoration(
                        color: VAPrimaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(75),
                            bottomLeft: Radius.circular(35))
                        // BorderRadius.vertical(bottom: Radius.circular(55)),

                        ))),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: Duration(milliseconds: 1600),
                top: 80,
                left: splashController.animate.value ? VADefaultSize : -80,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 1600),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        VAAppName,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        VAAppTagLine,
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: Duration(milliseconds: 2400),
                bottom: splashController.animate.value ? 100 : 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 2000),
                    opacity: splashController.animate.value ? 1 : 0,
                    child: Image(
                      image: AssetImage(VASplashImage),
                      fit: BoxFit.contain,
                    ),
                  ),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: Duration(milliseconds: 2400),
                bottom: splashController.animate.value ? 60 : 0,
                right: VADefaultSize,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 2000),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Container(
                    width: VASplashContainerSize * 2,
                    height: VASplashContainerSize * 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: VAPrimaryColor,
                    ),
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
