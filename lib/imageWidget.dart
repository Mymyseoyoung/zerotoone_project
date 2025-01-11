import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final String assetPath;

  // Constructor for the widget
  const CustomImageWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/'), // Local asset image
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x195E5B5A),
            blurRadius: 7,
            offset: Offset(0, 3),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x165E5B5A),
            blurRadius: 13,
            offset: Offset(0, 13),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0C5E5B5A),
            blurRadius: 17,
            offset: Offset(0, 29),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x025E5B5A),
            blurRadius: 20,
            offset: Offset(0, 51),
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }
}
