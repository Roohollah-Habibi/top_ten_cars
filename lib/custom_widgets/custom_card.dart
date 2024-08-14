import 'package:flutter/material.dart';

const titleStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue);

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
      color: Colors.orange,
      child: ListTile(
        title: Text(title,style: titleStyle,),
        subtitle: Text(subtitle,style: const TextStyle(fontSize: 16,color: Colors.purple,),),
        leading: Icon(iconData),
      ),
    );
  }
}