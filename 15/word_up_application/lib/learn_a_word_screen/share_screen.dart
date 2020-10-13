import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/components/common_components.dart';

class ShareScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Share'),
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.blue[200]),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Share with Google or Facebook',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 5 * SizeConfig.textMultiplier,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
