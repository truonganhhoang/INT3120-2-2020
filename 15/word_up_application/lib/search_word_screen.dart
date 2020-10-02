import 'package:flutter/material.dart';

class SearchWordScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SearchWordScreenState();
}

class _SearchWordScreenState extends State<SearchWordScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text('Search word'),
      ),
    );
  }
}