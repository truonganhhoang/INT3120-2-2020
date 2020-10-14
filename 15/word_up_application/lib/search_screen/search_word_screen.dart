import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';

class SearchWordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchWordScreenState();
}

class _SearchWordScreenState extends State<SearchWordScreen> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text('Search'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 2*SizeConfig.heightMultiplier),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width: _folded ? 56 : 90*SizeConfig.widthMultiplier,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
            boxShadow: kElevationToShadow[6],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: !_folded
                      ? TextField(
                          decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyle(color: Colors.blue[300]),
                              border: InputBorder.none),
                        )
                      : null,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_folded ? 32 : 0),
                      topRight: Radius.circular(32),
                      bottomLeft: Radius.circular(_folded ? 32 : 0),
                      bottomRight: Radius.circular(32)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        _folded ? Icons.search : Icons.close,
                        color: Colors.blue[900],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _folded = !_folded;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
