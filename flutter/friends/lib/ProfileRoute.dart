import 'package:flutter/material.dart';
import 'ProfileListRoute.dart';

class ProfileRoute extends StatelessWidget {
  final Friend friend;

  ProfileRoute({Key key, this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: <Widget>[
          Image.network(this.friend.thumbnail),
          Text(this.friend.firstName),
          Text(this.friend.lastName),
          Text(this.friend.userName),
          Text(this.friend.email),
          Text(this.friend.age.toString()),
          Text(this.friend.cell),
        ],
      ),
    );
  }
}
