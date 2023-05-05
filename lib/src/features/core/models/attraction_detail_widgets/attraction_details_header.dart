import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';
import '../../controllers/attraction.dart';

class AttractionsDetailHeader extends StatelessWidget {
  const AttractionsDetailHeader({
    super.key,
    required this.attraction,
    required this.brightnessDark,
  });

  final Attraction attraction;
  final bool brightnessDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(attraction.picture), fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.map_marker,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(attraction.location)
                      ],
                    ),
                    Container(
                      child: Icon(
                        LineAwesomeIcons.heart,
                        size: 30,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    attraction.title,
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: brightnessDark ? VADTextColor : VALTextColor),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Divider(
                    color: brightnessDark ? VADTextColor : VALTextColor,
                    thickness: 5,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(LineAwesomeIcons.heart),
                        SizedBox(
                          width: 5,
                        ),
                        Text("10 Peoples liked this")
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Icon(LineAwesomeIcons.comment),
                        SizedBox(
                          width: 5,
                        ),
                        Text("2")
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      child: Text(attraction.description),
                    )
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
