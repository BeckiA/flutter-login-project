import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Attraction extends StatelessWidget {
  final String id;
  final String title;
  final String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final String location;
  final String picture;

  Attraction({
    Key? key,
    required this.id,
    required this.title,
    required this.location,
    required this.picture,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Jesus is here");
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(picture), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(LineAwesomeIcons.map_marker),
                      SizedBox(
                        width: 5,
                      ),
                      Text("$location")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(LineAwesomeIcons.clock),
                          SizedBox(
                            width: 5,
                          ),
                          Text("$date"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(LineAwesomeIcons.heart),
                          SizedBox(
                            width: 5,
                          ),
                          Text("20"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(LineAwesomeIcons.comment),
                          SizedBox(
                            width: 5,
                          ),
                          Text("30"),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
