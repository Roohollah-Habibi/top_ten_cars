import 'package:flutter/material.dart';
import 'package:top_ten/car_model/car_object.dart';
import 'package:top_ten/object_lists/card_list.dart';
import 'package:top_ten/styles_&_decorations/styles_and_decorations.dart';

import 'custom_widgets/custom_grid_car_features.dart';
import 'object_lists/car_model_lists.dart';
import 'custom_widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _carIndex = 0;
CarObject foundCar = carModelsLists[_carIndex];
const textStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red);

class _HomeScreenState extends State<HomeScreen> {
  String homeScreenImgSrc = foundCar.imgSrc;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text('Foo App'),
        backgroundColor: Colors.red,
        actions: [
          buildPopupMenuButton(),
        ],
      ),
      body: Center(
        child: Container(
          decoration: backgroundColor,
          child: Column(
              children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(homeScreenImgSrc,fit: BoxFit.contain,),
            ),
                Text(
                  foundCar.carName,
                  style: textStyle,
                ),
                Text(
                  foundCar.price,
                  style: textStyle,
                ),
            CustomGridCarFeatures(index: _carIndex,),
                Flexible(
                  child: ListWheelScrollView.useDelegate(
                    onSelectedItemChanged: (value) {
                      _carIndex = value;
                      setState(() {
                        homeScreenImgSrc = carModelsLists[value].imgSrc;
                      });
                    },
                    physics: const FixedExtentScrollPhysics(),
                    itemExtent: 100,
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: carModelsLists.length,
                      builder: (context, index) {
                        return Card(
                          elevation: 2,
                          child: ListTile(
                            title: Text(foundCar.carName),
                            trailing: InkWell(

                              child: Image.asset(
                                carModelsLists[index].imgSrc,
                                fit: BoxFit.cover,
                                isAntiAlias: true,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
          ]),
        ),
      ),
    );
  }

  PopupMenuButton<String> buildPopupMenuButton() {
    return PopupMenuButton<String>(
      // shadowColor: Colors.red,
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      // elevation: 20,
      enableFeedback: true,
      iconSize: 35,
      iconColor: Colors.yellow,
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {},
          child: const Text(
            'Share the app',
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        PopupMenuItem(
          child: Text(
            'About',
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        PopupMenuItem(
          // padding: EdgeInsets.symmetric(horizontal: 60),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            trailing: Icon(
              Icons.exit_to_app,
              color: Colors.red,
              size: 25,
            ),
            title: Text('Exit'),
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
            tileColor: Colors.orange,
            titleTextStyle: TextStyle(
                fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
