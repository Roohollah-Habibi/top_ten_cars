import 'package:flutter/material.dart';
import 'package:top_ten/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String popValue = 'Share the app';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Foo App'),
          backgroundColor: Colors.red,
          actions: [
            PopupMenuButton<String>(
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
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    'About',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
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
                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    tileColor: Colors.orange,
                    titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Column(
            children: [],
          )),
        ));
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
