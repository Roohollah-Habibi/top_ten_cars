import 'package:flutter/material.dart';

final class CarObject {
  final String carName;
  final int carId;
  final String price;
  final String engin;
  final String horsepower;
  final String seating;
  final String warranty;
  final String imgSrc;
  static const  enginIcon = Icons.settings;
  static const  horsepowerIcon = Icons.power;
  static const  seatingIcon = Icons.security;
  static const  warrantyIcon = Icons.add_a_photo_rounded;


  CarObject({
    required this.carId,
    required this.carName,
    required this.price,
    required this.engin,
    required this.horsepower,
    required this.seating,
    required this.warranty,
    required this.imgSrc,
  });
}
