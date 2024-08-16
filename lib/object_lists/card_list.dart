import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:top_ten/custom_widgets/features_custom_card.dart';
import 'car_model_lists.dart';

List<FeaturesCustomCard> cardList (int carIndex){
  return [
    FeaturesCustomCard(
      iconData: FontAwesomeIcons.gears,
      title: 'Engin',
      subtitle: carModelsLists[carIndex].engin,
    ),
    FeaturesCustomCard(
      iconData: FontAwesomeIcons.award,
      title: 'Warranty',
      subtitle: carModelsLists[carIndex].warranty,
    ),
    FeaturesCustomCard(
      iconData: FontAwesomeIcons.chair,
      title: 'Seating',
      subtitle: carModelsLists[carIndex].seating,
    ),
    FeaturesCustomCard(
      iconData: FontAwesomeIcons.carBattery,
      title: 'Horsepower',
      subtitle: carModelsLists[carIndex].horsepower,
    ),
  ];
}