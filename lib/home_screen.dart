import 'package:flutter/material.dart';
import 'car_feature.dart';
import 'car_object.dart';
import 'custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _carIndex = 0;
const textStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red);

class _HomeScreenState extends State<HomeScreen> {
  String homeScreenImgSrc = carFeatureList[_carIndex].imgSrc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foo App'),
        backgroundColor: Colors.red,
        actions: [
          buildPopupMenuButton(),
        ],
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(homeScreenImgSrc),
          ),
          Flexible(
            child: Column(
              children: [
                Text(
                  carFeatureList[_carIndex].carName,
                  style: textStyle,
                ),
                Text(
                  carFeatureList[_carIndex].price,
                  style: textStyle,
                ),
                Flexible(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 2,
                      mainAxisExtent: 100,
                    ),
                    itemCount: carFeatureList.length,
                    itemBuilder: (context, index) => CustomCard(
                        txt: carFeatureList[index].feature[index],
                        index: index),
                  ),
                ),
                Flexible(
                  child: ListWheelScrollView.useDelegate(
                    onSelectedItemChanged: (value) {
                      _carIndex = value;
                      setState(() {
                        homeScreenImgSrc = carFeatureList[value].imgSrc;
                      });
                    },
                    physics: const FixedExtentScrollPhysics(),
                    itemExtent: 130,
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: carFeatureList.length,
                      builder: (context, index) {
                        return Card(
                          elevation: 2,
                          child: ListTile(
                            leadingAndTrailingTextStyle: TextStyle(
                                fontWeight: FontWeight.bold, height: 50),
                            title: Text(carFeatureList[index].carName),
                            trailing: Image.asset(
                              carFeatureList[index].imgSrc,
                              fit: BoxFit.cover,
                              isAntiAlias: true,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
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
