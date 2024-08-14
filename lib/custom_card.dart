import 'package:flutter/material.dart';

import 'car_feature.dart';
import 'car_object.dart';
class CustomCard extends StatelessWidget {
  final String txt;
  final int index;
  const CustomCard({
    super.key,
    required this.txt,
    required this.index
  });
  @override
  Widget build(BuildContext context) {
    final IconData iconData = txt.toLowerCase() == 'horsepower'
        ? CarObject.horsepowerIcon
        : txt.toLowerCase() == 'seating'
        ? CarObject.seatingIcon
        : txt.toLowerCase() == 'warranty'
        ? CarObject.warrantyIcon
        : CarObject.enginIcon;

    return Card(
      color: Colors.orange,
      child: ListTile(
        title: Text(txt),
        subtitle: Text(carFeatureList[index].engin),
        leading: Icon(iconData),
      ),
    );
  }
}