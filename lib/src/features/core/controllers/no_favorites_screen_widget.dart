import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/image_strings.dart';

class NoFavorites extends StatelessWidget {
  const NoFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Image.asset(
                  VAItrenaryImage,
                  fit: BoxFit.cover,
                  width: 300,
                  height: 300,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "No favorites yet",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Keep track of the attraction sites you're \n interested in by clicking the ❤ icon",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 14),
              )
            ],
          ),
        ),
      ],
    );
  }
}
