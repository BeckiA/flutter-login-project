import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/colors.dart';
import '../../controllers/carousel_controller/carousel_logics.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  _CarouselWithIndicatorDemoState createState() =>
      _CarouselWithIndicatorDemoState();
}

class _CarouselWithIndicatorDemoState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Get.put(CarouselLogic());
    return Container(
        child: Column(children: [
      Stack(children: [
        CarouselSlider(
          items: CarouselLogic.instance.imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 17 / 8,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                // _current = index.obs;
                setState(() {
                  _current = index;
                });
              }),
        ),
        AspectRatio(
          aspectRatio: 17 / 10, // changed aspect ratio to fit the new card size
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 110, // added fixed height to contain the card
              child: Stack(children: [
                Positioned(
                  bottom: 20.0,
                  left: 0.0,
                  right: 0.0,
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7.0, horizontal: 0.0),
                        child: Column(
                          children: [
                            Text(
                              CarouselLogic.instance.siteNames[_current],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              height: 2,
                              thickness: 2,
                              indent: 20,
                              endIndent: 20,
                              color: Colors.black26,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        LineAwesomeIcons.heart,
                                        color: Colors.red.withOpacity(0.75),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text("20")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(LineAwesomeIcons.comment),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text("4")
                                    ],
                                  ),
                                ]),
                          ],
                        )),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: CarouselLogic.instance.imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? VAPrimaryColor
                          : VAAccentColor)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]));
  }
}
