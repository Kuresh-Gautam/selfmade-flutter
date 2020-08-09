import 'package:flutter/material.dart';
import 'package:soc/onboarding/unboarding.dart';
import 'package:soc/pages/constraint.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: KPrimaryColor,
          textTheme: TextTheme(
            headline5: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: IntroFourPage(),
    );
  }
}
