import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({Key key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  int _selectedCategoryIndex = 0;

  Widget _buildCategoryCard(int index, String title, int count) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      height: 240.0,
      width: 175.0,
      decoration: BoxDecoration(
        color: _selectedCategoryIndex == index
            ? Color(0xFF417BFB)
            : Color(0xFF417BFB),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          _selectedCategoryIndex == index
              ? BoxShadow(
                  color: Colors.black26, offset: Offset(0, 2), blurRadius: 10.0)
              : BoxShadow(color: Colors.transparent)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              title,
              style: TextStyle(
                  color: _selectedCategoryIndex == index
                      ? Colors.white
                      : Color(0xffafb4c6)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              count.toString(),
              style: TextStyle(
                color: _selectedCategoryIndex == index
                    ? Colors.white
                    : Colors.black,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var categories;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/Avatar.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  "RISHAB NAYAK",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox(
                    width: 20.0,
                  );
                }
                return _buildCategoryCard(
                  index - 1,
                  categories.keys.toList()[index - 1],
                  categories.value.toList()[index - 1],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
