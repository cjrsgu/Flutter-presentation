import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String text;
  final Function removeItem;
  final Function switchFinished;
  final Function changeText;
  final int index;
  final bool finished;

  Item({
    Key key,
    this.text,
    this.removeItem,
    this.switchFinished,
    this.changeText,
    this.index,
    this.finished,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: this.finished
              ? IconButton(
                  icon: Icon(
                    Icons.check,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    this.switchFinished(this.index);
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.check_box_outline_blank,
                    size: 30.0,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    this.switchFinished(this.index);
                  }),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.5,
          child: TextField(
            onSubmitted: (text) => this.changeText(this.index, text),
            decoration: InputDecoration(
              border: InputBorder.none, hintText: this.text),
          ),
        ),
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            this.removeItem(this.index);
          },
        ),
      ],
    );
  }
}
