import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserProfileScreen();
}

class _UserProfileScreen extends State<UserProfileScreen> {
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.red,
        child: Text('Profile User'),
      ),
    );
  }
}
