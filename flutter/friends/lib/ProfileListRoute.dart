import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:core';
import 'ProfileRoute.dart';

class ProfileListRoute extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Friends'),
        ),
        body: new FriendCards(),
      );
    }
  }


class FriendCards extends StatelessWidget {
  Future<List<Friend>> fetchFriends() async {
    final Response response = await get('https://randomuser.me/api/?results=25');
    print(json.decode(response.body)['results']);
    List responseJson = json.decode(response.body)['results'];
    // var responseJson = json.decode(response.body);
    return responseJson.map((m) => new Friend.fromJson(m)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List<Friend>>(
    future: fetchFriends(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return Container();
      List<Friend> friends = snapshot.data;
      return new ListView(
        children: friends.map((friend) =>
        GestureDetector(
          child: Row(
            children: <Widget>[
              Image.network(friend.thumbnail),
              Text('${friend.firstName} ${friend.lastName}'),
            ],
          ),
          onTap: () {
            print('tapped');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => new ProfileRoute(friend: friend))
            );
          },
        )
        ).toList(),
      );
    },
  );
  }
}

class Friend {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final int age;
  final String cell;
  final String thumbnail;

  Friend({
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.age,
    this.cell,
    this.thumbnail,
  });

  factory Friend.fromJson(Map<String, dynamic> json) {
      return new Friend(
        firstName: json['name']['first'].toString(),
        lastName: json['name']['last'].toString(),
        userName: json['login']['username'].toString(),
        thumbnail: json['picture']['thumbnail'].toString(),
        email: json['email'].toString(),
        age: json['dob']['age'],
        cell: json['cell'],
      );
  }
}
