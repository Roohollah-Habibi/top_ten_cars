import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:top_ten/custom_widgets/custom_card.dart';
import 'car_model_lists.dart';

List<CustomCard> cardList (int carIndex){
  return [
    CustomCard(
      iconData: FontAwesomeIcons.gears,
      title: 'Engin',
      subtitle: carModelsLists[carIndex].engin,
    ),
    CustomCard(
      iconData: FontAwesomeIcons.award,
      title: 'Warranty',
      subtitle: carModelsLists[carIndex].warranty,
    ),
    CustomCard(
      iconData: FontAwesomeIcons.chair,
      title: 'Seating',
      subtitle: carModelsLists[carIndex].seating,
    ),
    CustomCard(
      iconData: FontAwesomeIcons.carBattery,
      title: 'Horsepower',
      subtitle: carModelsLists[carIndex].horsepower,
    ),
  ];
}