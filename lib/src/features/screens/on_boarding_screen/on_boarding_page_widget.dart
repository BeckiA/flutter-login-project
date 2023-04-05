import 'package:flutter/material.dart';
import '../../../constants/sizes.dart';
import '../../model/on_boarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(VADefaultSize),
      color: model.bgColor,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image(
          image: AssetImage(model.image),
          height: size.height * 0.4,
        ),
        Column(
          children: [
            Text(
              model.title,
              style: TextStyle(
                fontSize: 38,
                fontFamily: "Montserrat",
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              model.subTitle,
              style: TextStyle(
                  fontFamily: "Poppins", color: Colors.black, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
        Text(model.counterText, style: Theme.of(context).textTheme.titleLarge),
        SizedBox(
          height: 50.0,
        )
      ]),
    );
  }
}
