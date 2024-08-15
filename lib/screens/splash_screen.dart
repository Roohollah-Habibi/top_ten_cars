
import 'package:flutter/material.dart';

import '../styles_&_decorations/styles_and_decorations.dart';

const carLogo = 'assets/images/carlogo.png';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        carLogo,
                      ),
                      buildTextCompanyName,
                      buildTextCompanySlogan,
                    ],
                  )),
              buildTextAppVersion,
            ],
          ),
        ),
      ),
    );
  }

  Text get buildTextAppVersion {
    return Text(
      'version 0.1.1',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.indigo.shade900),
    );
  }

  Text get buildTextCompanySlogan {
    return const Text(
      'Safe & Fast',
      textHeightBehavior: TextHeightBehavior(
          applyHeightToFirstAscent: false, applyHeightToLastDescent: false),
      style: TextStyle(
        wordSpacing: 10,
        letterSpacing: 2,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Text get buildTextCompanyName {
    return const Text(
      'HR',
      textHeightBehavior: TextHeightBehavior(
        applyHeightToLastDescent: false,
        applyHeightToFirstAscent: false,
      ),
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 100, color: Colors.white70),
    );
  }
}
