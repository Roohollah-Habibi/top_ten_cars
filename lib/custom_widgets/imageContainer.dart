import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double height;
  final double width;
  final String imageSrc;
  const ImageContainer({super.key, required this.height, required this.width,required this.imageSrc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(imageSrc,fit: BoxFit.cover,alignment: Alignment.center,),
    );
  }
}
