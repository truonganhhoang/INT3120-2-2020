import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';

class AccountPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: SizeConfig.screenWidth / 3 * 2.2,
        child: Drawer(
          elevation: 300,
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(accountName: Text('Truong'), accountEmail: null)
            ],
          ),
        ),
      ),
    );
  }
}