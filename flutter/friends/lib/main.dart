import 'package:flutter/material.dart';
import 'ProfileListRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friends',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ProfileListRoute(),
    );
  }
}
