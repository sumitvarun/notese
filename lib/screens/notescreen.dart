import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({Key key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40.0,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50.0, width: 50.0,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images\AvatarMaker (32).png'))
              ),
              ),
          ],),),
        ],
      ),
    )
  }
}