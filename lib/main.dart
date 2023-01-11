import 'package:flutter/material.dart';
import 'package:slide_show_widget/Demo_Screen.dart';
import 'package:slide_show_widget/slide_show_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoScreen(),
    );
  }
}
