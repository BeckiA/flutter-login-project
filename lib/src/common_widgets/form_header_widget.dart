import 'package:flutter/material.dart';

import '../constants/image_strings.dart';
import '../constants/text_strings.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    this.heightBetween,
    this.imageColor,
    this.imageHeight = 0.2,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign,
    required this.size,
    required this.image,
    required this.subTitle,
    required this.title,
  });

  final Size size;
  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * 0.25,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
          // textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
