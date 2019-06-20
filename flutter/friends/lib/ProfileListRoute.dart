import 'package:flutter/material.dart';
import 'ProfileRoute.dart';

class ProfileListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileRoute()),
            );
          },
        ),
      ),
    );
  }
}
