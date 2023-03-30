import 'package:flutter/material.dart';

import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(VALoginScreenImage),
          height: size.height * 0.25,
        ),
        Text(
          VALoginTitle,
          style: Theme.of(context).textTheme.displayMedium,
          // textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          VALoginSubTitle,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
