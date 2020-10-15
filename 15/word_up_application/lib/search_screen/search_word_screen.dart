import 'package:flutter/material.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/size_config.dart';

class SearchWordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchWordScreenState();
}

class _SearchWordScreenState extends State<SearchWordScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 2*SizeConfig.heightMultiplier, right: 1.5*SizeConfig.heightMultiplier, left: 1.5*SizeConfig.heightMultiplier),
        decoration: CommonComponents.background,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
            boxShadow: kElevationToShadow[6],
          ),
          child: Container(
            margin: EdgeInsets.only(left: 8),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.blue[300]),
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
    );
  }
}
