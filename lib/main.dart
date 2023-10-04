import 'package:day12_newapp_using_dio_json/screens/NewsAppScreen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsAppScreen(),
    );
  }
}
