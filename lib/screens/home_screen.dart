import 'package:flutter/material.dart';
import 'package:top_ten/car_model/car_object.dart';

import 'package:top_ten/screens/details_screen.dart';
import 'package:top_ten/styles_&_decorations/styles_and_decorations.dart';
import '../custom_widgets/custom_grid_car_features.dart';
import '../object_lists/car_model_lists.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _carIndex = 0;

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool favorite = false;
  double scaleFavorite = 1;
  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 500));

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String homeScreenImgSrc = carModelsLists[_carIndex].imgSrc;
    CarObject foundCar = carModelsLists[_carIndex];
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(
          'Home',
          style: appBarTextStyle,
        ),
        backgroundColor: Colors.indigo,
        actions: [
          buildPopupMenuButton(),
        ],
      ),
      body: Center(
        child: Container(
          decoration: backgroundColor,
          child: Column(children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: buildGridTile(foundCar, homeScreenImgSrc),
            ),
            Text(
              foundCar.carName,
              style: showNameTextStyle,
            ),
            Text(
              foundCar.price,
              style: showPriceTextStyle,
            ),
            CustomGridCarFeatures(
              index: _carIndex,
            ),
            buildScrollView(homeScreenImgSrc)
          ]),
        ),
      ),
    );
  }

  GridTile buildGridTile(CarObject foundCar, String homeScreenImgSrc) {
    return GridTile(
        footer: GridTileBar(
          trailing: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(
              child: AnimatedScale(
                scale: scaleFavorite,
                duration: const Duration(milliseconds: 500),
                child: buildLikeButton,
              ),
            ),
          ),
          title: Text(
            foundCar.carName,
            style: imageTextStyle,
          ),
        ),
        child: Image.asset(
          homeScreenImgSrc,
          fit: BoxFit.contain,
        ));
  }

  Flexible buildScrollView(String homeScreenImgSrc) {
    return Flexible(
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
              shadowColor: Colors.indigo,
              elevation: 10,
              color: Colors.black,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(40)),
              child: buildWheelScrollViewListTile(index),
            );
          },
        ),
      ),
    );
  }

  InkWell get buildLikeButton {
    return InkWell(
      onTap: () {
        setState(() {
          favorite = !favorite;
          if (favorite) {
            scaleFavorite = 1.2;
          } else {
            scaleFavorite = 1;
          }
        });
      },
      child: Icon(
        size: 35,
        favorite ? Icons.favorite : Icons.favorite_border,
        color: favorite ? Colors.red.shade500 : Colors.white,
      ),
    );
  }

  ListTile buildWheelScrollViewListTile(int index) {
    CarObject foundCar = carModelsLists[index];
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const DetailsScreen(),
      )),
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(70)),
      tileColor: Colors.orange.shade200,
      isThreeLine: true,
      titleAlignment: ListTileTitleAlignment.center,
      titleTextStyle: scrollWheelTitleTextStyle,
      subtitleTextStyle: scrollWheelSubtitleTextStyle,
      title: Text(
        foundCar.carName,
      ),
      subtitle: Text(foundCar.price),
      trailing: InkWell(
        child: Image.asset(
          carModelsLists[index].imgSrc,
          fit: BoxFit.cover,
          isAntiAlias: true,
        ),
      ),
    );
  }

  PopupMenuButton<String> buildPopupMenuButton() {
    return PopupMenuButton<String>(
      enableFeedback: true,
      iconSize: 35,
      iconColor: Colors.orange.shade300,
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {},
          child: Text(
            'Share the app',
            style: popUpMenuStyle,
          ),
        ),
        PopupMenuItem(
          onTap: () => showAboutApp(context),
          child: Text('About app', style: popUpMenuStyle),
        ),
        PopupMenuItem(
          onTap: () {
            buildShowExitDialog(context);
          },
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            trailing: const Icon(
              Icons.exit_to_app,
              color: Colors.red,
              size: 25,
            ),
            title: Text(
              'Exit',
              style: popUpMenuStyle,
            ),
            tileColor: Colors.orange,
            titleTextStyle: const TextStyle(
                fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Future<dynamic> buildShowExitDialog(BuildContext context) {
    return showDialog(
              context: context,
              builder: (context) => Center(
                child: Container(
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.exit_to_app,size: 40,color: Colors.red,),
                          const Text('Are you sure?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text('NO'),),
                            const SizedBox(width: 50),
                                ElevatedButton(onPressed: (){Navigator.pop(context);Navigator.pop(context);}, child: Text('Yes'),)
                          ]

                      )]),
                ),
              ));
  }
}

void showAboutApp(BuildContext context) {
  showAboutDialog(
    context: context,
    applicationIcon: const Icon(
      Icons.info_outline,
      size: 30,
      color: Colors.green,
    ),
    applicationVersion: '0.1.1',
    applicationName: 'Top ten luxury cars',
    barrierDismissible: false,
    barrierColor: Colors.orange.withOpacity(.4),
  );
}