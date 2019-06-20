import 'package:flutter/material.dart';
import 'ProfileListRoute.dart';

String upperFirst(String str) {
  return str[0].toUpperCase() + str.substring(1);
}

class ProfileRoute extends StatelessWidget {
  final Friend friend;

  ProfileRoute({Key key, this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = 20;

    return Scaffold(
      appBar: AppBar(
        title: Text('${upperFirst(this.friend.firstName)}\'s profile'),
      ),
      body: Container(
        alignment: Alignment(0.0, 0.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: new BorderRadius.circular(100),
              child: Image.network(
                friend.largeImage,
                width: 200,
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 5.0,
              ),
              child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child:
                      Text('First name: ${upperFirst(this.friend.firstName)}',
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Colors.orange,
                          )),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text('Last name: ${upperFirst(this.friend.lastName)}',
                            style: TextStyle(
                              fontSize: fontSize,
                              color: Colors.orange,
                            ))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Username: ${this.friend.userName}',
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.orange,
                        ))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Email: ${this.friend.email}',
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.orange,
                        ))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Age: ${this.friend.age.toString()}',
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.orange,
                        ))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cell: ${this.friend.cell}',
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.orange,
                        ))),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
