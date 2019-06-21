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
    List responseJson = json.decode(response.body)['results'];
    return responseJson.map((m) => new Friend.fromJson(m)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List<Friend>>(
    future: fetchFriends(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        List<Friend> friends = snapshot.data;
        return new ListView(
          children: friends.map((friend) =>
          GestureDetector(
            child: Container(
              decoration:BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: 4.0, color: Colors.orange[100]),
                ),
              ),
              padding: EdgeInsets.only(
                left: 5.0,
                right: 5.0,
              ),
              width: 48.0,
              height: 48.0,
              constraints: BoxConstraints.expand(
                width: double.infinity,
                height: 100.0,
              ),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(50),
                    child: Image.network(
                      friend.mediumImage,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      '${upperFirst(friend.firstName)} ${upperFirst(friend.lastName)}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => new ProfileRoute(friend: friend))
              );
            },
          )
          ).toList(),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
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
  final String largeImage;
  final String mediumImage;

  Friend({
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.age,
    this.cell,
    this.thumbnail,
    this.mediumImage,
    this.largeImage,
  });

  factory Friend.fromJson(Map<String, dynamic> json) {
      return new Friend(
        firstName: json['name']['first'].toString(),
        lastName: json['name']['last'].toString(),
        userName: json['login']['username'].toString(),
        thumbnail: json['picture']['thumbnail'].toString(),
        mediumImage: json['picture']['medium'].toString(),
        largeImage: json['picture']['large'].toString(),
        email: json['email'].toString(),
        age: json['dob']['age'],
        cell: json['cell'],
      );
  }
}
