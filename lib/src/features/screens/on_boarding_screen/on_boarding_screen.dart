import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/colors.dart';

import '../../controllers/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ObController = OnBoardingController();
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        LiquidSwipe(
          pages: ObController.pages,
          liquidController: ObController.controller,
          onPageChangeCallback: ObController.OnPageChangeCallback,
          slideIconWidget: const Icon(Icons.arrow_back_ios),
          enableSideReveal: true,
        ),
        Obx(() => Positioned(
            bottom: 60.0,
            child: ObController.currentPage.value == 2
                ? ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 64, vertical: 16)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(VASeconsdaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white)))),
                    onPressed: () {
                      ObController.displayLogin();
                    },
                    child: Text("Get Started"),
                  )
                : OutlinedButton(
                    onPressed: () {
                      ObController.animateToNextSlide();
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.black26),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        onPrimary: Colors.white),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFF171201),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_forward_ios),
                    )))),
        Positioned(
          top: 50,
          right: 20,
          child: TextButton(
              onPressed: () {
                ObController.skip();
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              )),
        ),
        Obx(
          () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: ObController.currentPage.value,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Color(0xFF171201),
                  dotHeight: 5.0,
                ),
              )),
        ),
      ],
    ));
  }
}
