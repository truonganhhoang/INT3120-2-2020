import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/firebase/firebase_handler.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/search_screen/search_word_screen.dart';
import 'package:word_up_application/selection_screen/finish_selection_screen.dart';
import 'package:word_up_application/selection_screen/selection_screen.dart';
import 'package:word_up_application/services/authentication_screen.dart';
import 'package:word_up_application/services/database_server_handler.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/user.dart';
import 'home/home_screen.dart';
import 'learn_a_word_screen/learn_a_word_screen.dart';
import 'user_profile_screen/user_profile_screen.dart';
import 'word.dart';
import 'favorite_screen/favorite_words_screen.dart';
import 'package:device_preview/device_preview.dart';

bool isTestResponsiveMode = false;

void main() {
  runApp(
    (isTestResponsiveMode)
        ? DevicePreview(
            enabled: !kReleaseMode,
            builder: (context) => MyApp(),
          )
        : MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DatabaseServerHandler.instance.getAllUsers();
    //DatabaseServerHandler.instance.updateLearnProgress('1122817271');
   // DatabaseHelper.instance.databaseInit();
    //DatabaseHelper.instance.getNWords(3);
    //DatabaseHelper.instance.getListFarvoriteWords();
   // DatabaseHelper.instance.getExamplesWithId(1);


    FirebaseHandler.initializeFirebase();
    //DatabaseHelper.instance.databaseInit();
   // DatabaseHelper.instance.getNWords(5);
    
    //DatabaseHelper.instance.getListFarvoriteWords();
    print('runMain');

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          if (isTestResponsiveMode) {
            // this is device package
            return MaterialApp(
              locale: (isTestResponsiveMode)
                  ? DevicePreview.of(context).locale
                  : Locale(null),
              builder: (isTestResponsiveMode)
                  ? DevicePreview.appBuilder
                  : build(context),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: FinishSelectionScreen(),
            );
          } else {
            // default app
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: AuthenticationScreen(),
            );
          }
        });
      },
    );
  }
}
