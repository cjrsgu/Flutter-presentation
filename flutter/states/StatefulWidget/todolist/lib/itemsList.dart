import 'package:flutter/material.dart';
import 'package:todolist/item.dart';

class ToDoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO DO List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ToDoList(title: 'TO DO List'),
    );
  }
}

class ToDoList extends StatefulWidget {
  ToDoList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ToDoListState createState() => ToDoListState();
}

class ToDoListState extends State<ToDoList> {
  List<Item> _items = new List();

  void _addItem(text) {
    setState(() {
      _items.add(Item(
        key: UniqueKey(),
        text: text, 
        removeItem: _removeItem,
        index: _items.length,
        finished: false,
        switchFinished: _switchFinished,
        changeText: _changeText,
      ));
    });
  }

  void _changeText(index, text) {
    print(index.toString()+text);
    setState(() {
      int ind = _items.indexWhere((item) => item.index == index);
      _items[ind] = Item(
        key: UniqueKey(),
        text: text, 
        removeItem: _removeItem,
        index: index,
        finished: _items[ind].finished,
        switchFinished: _switchFinished,
        changeText: _changeText,
      );
    });
  }

  void _switchFinished(index) {
    setState(() {
      int ind = _items.indexWhere((item) => item.index == index);
      _items[ind] = Item(
        key: UniqueKey(),
        text: _items[ind].text, 
        removeItem: _removeItem,
        index: index,
        finished: !_items[ind].finished,
        switchFinished: _switchFinished,
        changeText: _changeText,
      );
    });
  }

  void _removeItem(index) {
    setState(() {
      _items.removeWhere((item) => item.index == index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return _items[index];
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addItem('Anime'),
        child: Icon(Icons.add),
      ),
    );
  }
}