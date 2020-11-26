import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietjack_mobile_app/LoginPage.dart';
import 'package:vietjack_mobile_app/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
void main(){
  testWidgets("test login page", (tester) async{
    await tester.pumpWidget(new MaterialApp(home:new LoginPage()));
    expect(find.byKey(new Key("test") ), findsOneWidget);
  });

}