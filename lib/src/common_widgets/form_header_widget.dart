import 'package:flutter/material.dart';

import '../constants/image_strings.dart';
import '../constants/text_strings.dart';

class FormHeader extends StatelessWidget {
  const FormHeader(
      {super.key,
      required this.size,
      required this.image,
      required this.subTitle,
      required this.title});

  final Size size;
  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
