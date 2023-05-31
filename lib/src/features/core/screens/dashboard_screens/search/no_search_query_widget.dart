import 'package:flutter/material.dart';

import '../../../../../constants/image_strings.dart';

class NoSearch extends StatelessWidget {
  const NoSearch({super.key});

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
                  VASearchImage,
                  fit: BoxFit.cover,
                  width: 250,
                  height: 250,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "No Search Queries found",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Input your keywords please and get your search results",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
