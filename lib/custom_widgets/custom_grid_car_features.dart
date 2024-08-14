import 'package:flutter/material.dart';

import '../object_lists/card_list.dart';

class CustomGridCarFeatures extends StatelessWidget {
  final int index;
  const CustomGridCarFeatures({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 100,
        ),
        children: cardList(index),
      ),
    );
  }
}
