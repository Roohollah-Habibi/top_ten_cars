import 'package:flutter/material.dart';
import 'package:top_ten/car_model/car_object.dart';
import 'package:top_ten/object_lists/car_model_lists.dart';
import 'package:top_ten/screens/details_screen.dart';
import 'package:top_ten/styles_&_decorations/styles_and_decorations.dart';
import 'package:top_ten/custom_widgets/custom_grid_car_features.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://github.com/roohollah-Habibi/');
int _carIndex = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double scaleFavorite = 1;
  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 500));

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
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
          child: Column(
              children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: GridTile(
                  footer: GridTileBar(
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Center(
                        child: AnimatedScale(
                          scale: scaleFavorite,
                          duration: const Duration(milliseconds: 500),
                          child: buildLikeButton(foundCar),
                        ),
                      ),
                    ),
                    title: InkWell(
                      //todo: here should be the code to move to the right page
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(myCar: foundCar),
                        ));
                      },
                      child: Text(
                        'See More...',
                        style: imageTextStyle,
                      ),
                    ),
                  ),
                  child: Image.asset(
                    homeScreenImgSrc,
                    fit: BoxFit.contain,
                  ))
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

  // GridTile buildGridTile(CarObject foundCar, String homeScreenImgSrc) {
  //   return GridTile(
  //       footer: GridTileBar(
  //         trailing: Padding(
  //           padding: const EdgeInsets.only(right: 20.0),
  //           child: Center(
  //             child: AnimatedScale(
  //               scale: scaleFavorite,
  //               duration: const Duration(milliseconds: 500),
  //               child: buildLikeButton(foundCar),
  //             ),
  //           ),
  //         ),
  //         title: InkWell(
  //           //todo: here should be the code to move to the right page
  //           onTap: () {
  //             Navigator.of(context).push(MaterialPageRoute(
  //               builder: (context) => DetailsScreen(myCar: foundCar),
  //             ));
  //           },
  //           child: Text(
  //             'See More...',
  //             style: imageTextStyle,
  //           ),
  //         ),
  //       ),
  //       child: Image.asset(
  //         homeScreenImgSrc,
  //         fit: BoxFit.contain,
  //       ));
  // }

  Flexible buildScrollView(String homeScreenImgSrc) {
    return Flexible(
      child: ListWheelScrollView.useDelegate(
        perspective: .005,
        overAndUnderCenterOpacity: .2,
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                shadowColor: Colors.indigo,
                elevation: 10,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(20)),
                child: buildWheelScrollViewListTile(index),
              ),
            );
          },
        ),
      ),
    );
  }

  InkWell buildLikeButton(CarObject foundCar) {
    return InkWell(
      onTap: () {
        foundCar.favorite = !foundCar.favorite;

        setState(() {
          if (foundCar.favorite) {
            scaleFavorite = 1.2;
          } else {
            scaleFavorite = 1;
          }
        });
      },
      child: Icon(
        size: 35,
        foundCar.favorite ? Icons.favorite : Icons.favorite_border,
        color: foundCar.favorite ? Colors.red.shade500 : Colors.white,
      ),
    );
  }

  Widget buildWheelScrollViewListTile(int index) {
    CarObject foundCar = carModelsLists[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsScreen(
            myCar: foundCar,
          ),
        )),
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20)),
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
          onTap: _launchUrl,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 1.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              trailing: const Icon(
                Icons.share,
                color: Colors.indigo,
                size: 25,
              ),
              title: const Text('Share the app'),
              tileColor: Colors.orange.shade300,
              titleTextStyle: appBarActionPopUpMenuStyle,
            ),
          ),
        ),
        PopupMenuItem(
          onTap: () => showAboutApp(context),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 1.0),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              trailing: const Icon(
                Icons.info_outline,
                color: Colors.indigo,
                size: 25,
              ),
              title: const Text('About app'),
              tileColor: Colors.orange.shade300,
              titleTextStyle: appBarActionPopUpMenuStyle,
            ),
          ),
        ),
        PopupMenuItem(
          onTap: () => buildShowExitDialog(context),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 1.0),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              trailing: const Icon(
                Icons.exit_to_app,
                color: Colors.indigo,
                size: 25,
              ),
              title: const Text('Exit'),
              tileColor: Colors.orange.shade300,
              titleTextStyle: appBarActionPopUpMenuStyle,
            ),
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
                      const Icon(
                        Icons.exit_to_app,
                        size: 40,
                        color: Colors.red,
                      ),
                      const Text(
                        'Are you sure?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('NO'),
                            ),
                            const SizedBox(width: 50),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text('Yes'),
                            )
                          ])
                    ]),
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
