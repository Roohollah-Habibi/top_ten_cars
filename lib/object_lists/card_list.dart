import 'package:flutter/material.dart';
import 'package:top_ten/custom_widgets/custom_card.dart';
import 'car_model_lists.dart';

List<CustomCard> cardList (int carIndex){
  return [
    CustomCard(
      iconData: Icons.settings,
      title: 'Engin',
      subtitle: carModelsLists[carIndex].engin,
    ),
    CustomCard(
      iconData: Icons.security,
      title: 'Warranty',
      subtitle: carModelsLists[carIndex].warranty,
    ),
    CustomCard(
      iconData: Icons.select_all,
      title: 'Seating',
      subtitle: carModelsLists[carIndex].seating,
    ),
    CustomCard(
      iconData: Icons.power,
      title: 'Horsepower',
      subtitle: carModelsLists[carIndex].horsepower,
    ),
  ];
}