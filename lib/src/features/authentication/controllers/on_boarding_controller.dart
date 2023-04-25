import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:login_app/src/features/authentication/model/on_boarding_model.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../screens/login/login_screen.dart';
import '../screens/on_boarding_screen/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();

  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
          bgColor: VAOnBoardingPage1Color,
          counterText: VAOnBoardingCounter1,
          image: VAOnBoardingImage1,
          subTitle: VAOnBoardingSubTitle1,
          title: VAOnBoardingTitle1),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
          bgColor: VAOnBoardingPage2Color,
          counterText: VAOnBoardingCounter2,
          image: VAOnBoardingImage2,
          subTitle: VAOnBoardingSubTitle2,
          title: VAOnBoardingTitle2),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
          bgColor: VAOnBoardingPage3Color,
          counterText: VAOnBoardingCounter3,
          image: VAOnBoardingImage3,
          subTitle: VAOnBoardingSubTitle3,
          title: VAOnBoardingTitle3),
    ),
  ];

  OnPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  displayLogin() {
    Get.to(LoginScreen());
  }

  skip() => controller.jumpToPage(page: 2);
}
