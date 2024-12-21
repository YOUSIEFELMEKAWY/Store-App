import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';

class BannersWidgets extends StatelessWidget {
  const BannersWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Carousel(
      autoScroll: true,
      autoScrollDuration: const Duration(seconds: 3),
      height: 300,
      indicatorBarColor: Colors.white,
      animationPageDuration: const Duration(milliseconds: 500),
      animationPageCurve: Curves.easeInOut,
      items: const [
        Image(image: AssetImage('assets/electronics.png')),
        Image(image: AssetImage('assets/Fashion Style Banner Design 908.jpg')),
        Image(image: AssetImage('assets/jewelery__48840.png'))
      ],
    );
  }
}
