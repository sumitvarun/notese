import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notese/model/note_model.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({Key key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen>
    with SingleTickerProviderStateMixin {
  int _selectedCategoryIndex = 0;
  TabController _tabController;
  final DateFormat _dateFormat = DateFormat('dd mm');
  final DateFormat _timeFormatter = DateFormat('hr min');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  Widget _buildCategoryCard(int index, String title, int count) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        height: 240.0,
        width: 175.0,
        decoration: BoxDecoration(
          color: _selectedCategoryIndex == index
              ? Color(0xFF22737D)
              : Color(0xFF013837),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            _selectedCategoryIndex == index
                ? BoxShadow(
                    color: Color(0xff74F6FF),
                    offset: Offset(0, 2),
                    blurRadius: 15.0)
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
                        : Color(0xff01FAF7)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: _selectedCategoryIndex == index
                      ? Colors.white
                      : Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  "SUMITVARUN",
                  style: TextStyle(
                    color: Color(0xff556465),
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
                  categories.values.toList()[index - 1],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.blueGrey[900],
              unselectedLabelColor: Colors.blueGrey[600],
              indicatorColor: Colors.blueGrey[800],
              indicatorWeight: 4.0,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Note",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Important",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Performed",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Work",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      notes[0].title,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      notes[0].title,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
