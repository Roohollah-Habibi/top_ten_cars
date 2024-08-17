import 'package:flutter/material.dart';
import 'package:top_ten/car_model/car_object.dart';
import 'package:top_ten/styles_&_decorations/styles_and_decorations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  final CarObject myCar;

  const DetailsScreen({super.key, required this.myCar});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}
final Uri _url = Uri.parse('https://cars.usnews.com/cars-trucks/rankings');
class _DetailsScreenState extends State<DetailsScreen> {
  List<Image> carListCarousel = [];
  Future<void> _readMore() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    CarObject myWid = widget.myCar;
    carListCarousel = [
      Image.asset(
        myWid.caroselImgs[0],
        fit: BoxFit.contain,
      ),
      Image.asset(
        myWid.caroselImgs[1],
        fit: BoxFit.contain,
      ),
      Image.asset(
        myWid.caroselImgs[2],
        fit: BoxFit.contain,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider(
              items: carListCarousel,
              options: CarouselOptions(
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                pageSnapping: false,
                viewportFraction: 1,
                enlargeCenterPage: true,
                autoPlay: false,
                height: 300,
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    myWid.carDetails,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: detailsTextStyle,
                  ),
                ),
              ),
            ),
            TextButton(onPressed:_readMore, child: const Text('Read More...',style: readMoreTextStyle,),
            )
          ],
        ),
      ),
    );
  }
}
