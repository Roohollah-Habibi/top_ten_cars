import 'package:flutter/material.dart';
import 'package:top_ten/styles_&_decorations/styles_and_decorations.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      surfaceTintColor: Colors.orange.shade300,
      shape: BeveledRectangleBorder(borderRadius: BorderRadiusDirectional.circular(20)),
      child: ListTile(
        minLeadingWidth: 0,
        isThreeLine: true,
        minVerticalPadding: 20,
        iconColor: Colors.white,
        titleAlignment: ListTileTitleAlignment.center,
        subtitleTextStyle: cardListTitleStyle,
        titleTextStyle: cardListTitleStyle,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          subtitle,
          textAlign: TextAlign.center,
          style: cardListSubtitleStyle,
        ),
        //todo: make an appropriate icon here
        leading: Icon(iconData,size: 30,),
      ),
    );
  }
}
