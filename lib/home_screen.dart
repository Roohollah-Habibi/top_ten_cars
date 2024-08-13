import 'package:flutter/material.dart';
import 'car_feature.dart';
import 'car_object.dart';

var imgSrc = 'assets/images/car.png';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String popValue = 'Share the app';
  int carObjectIndex = 0;

  List<CarObject> cars = [
    CarObject(0, 'carOne', 'car details one', 'assets/images/Nissan-Versa.png',
        carFeature: carFeatureList[0]),
    CarObject(1, 'carTwo', 'car details 2', 'assets/images/Kia-Soul.png',
        carFeature: carFeatureList[1]),
    CarObject(
        2, 'carThree', 'car details 3', 'assets/images/Mitsubishi-Mirage.png',
        carFeature: carFeatureList[2]),
    // CarObject(3, 'carfour', 'car details 4', 'car.png'),
    // CarObject(4, 'carfive', 'car details 5', '_carImage 5'),
    // CarObject(5, 'carsix', 'car details 6', '_carImage 6'),
    // CarObject(6, 'carseven', 'car details 7', '_carImage 7'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Foo App'),
          backgroundColor: Colors.red,
          actions: [
            buildPopupMenuButton(),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset(imgSrc),
              Flexible(
                  child: Column(
                children: [
                  Text(
                    cars[carObjectIndex].carFeature?['Name'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.red),
                  ),
                  Row(
                    children: [
                      buildFeaturesRow(),
                      buildFeaturesRow(),
                    ],
                  ),
                ],
              )),
              Flexible(
                child: ListWheelScrollView.useDelegate(
                  onSelectedItemChanged: (value) {
                    carObjectIndex = value;
                    setState(() {
                      imgSrc = cars[value].carImage;
                    });
                  },
                  physics: const FixedExtentScrollPhysics(),
                  itemExtent: 100,
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: cars.length,
                    builder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          leadingAndTrailingTextStyle: TextStyle(
                              fontWeight: FontWeight.bold, height: 50),
                          title: Text(cars[index].carName),
                          trailing: Image.asset(
                            cars[index].carImage,
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
        ));
  }

  Expanded buildFeaturesRow(
      {required String featureName,
      required String featureValue,
      required IconData iconData}) {
    return Expanded(
      child: ListTile(
        title: Text(featureName),
        subtitle: Text(featureValue),
        leading: Icon(iconData),
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
      initialValue: popValue,
      iconSize: 35,
      iconColor: Colors.yellow,
      // shape: BeveledRectangleBorder(
      //   borderRadius: BorderRadius.circular(20),
      // ),
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

  DropdownButton<String> get buildMoreDropdownButton {
    return DropdownButton<String>(
      icon: const Icon(Icons.more_vert_outlined),
      iconSize: 35,
      iconEnabledColor: Colors.yellow,
      dropdownColor: Colors.orange,
      items: [
        DropdownMenuItem(
          child: Text('Share the app'),
          value: 'Share the app',
          alignment: Alignment.center,
        ),
        DropdownMenuItem(
          alignment: Alignment.center,
          child: Text('About'),
          value: 'About',
          onTap: () {},
        ),
        DropdownMenuItem(
          alignment: Alignment.center,
          child: Text('Exit'),
          value: 'Exit',
        ),
      ],
      onChanged: (String? value) {
        popValue = value!;
        if (popValue == 'About') {
          print('About===============');
        } else if (popValue == 'Exit') {
          print('Exit ================');
        } else {
          print('Share the App =============');
        }
        customOnTap();
      },
    );
  }

  Card buildCard() {
    return Card(
      color: Colors.red,
      child: ListTile(
        title: Text('text'),
      ),
    );
  }

  void customOnTap() {
    print('Hello');
    showAboutDialog(context: context, applicationIcon: Icon(Icons.ad_units));
  }
}
