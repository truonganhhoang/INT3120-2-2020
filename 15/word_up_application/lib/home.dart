import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/favorite_words_screen.dart';
import 'package:word_up_application/play_game_screen.dart';
import 'package:word_up_application/search_word_screen.dart';
import 'package:word_up_application/study_home_screen.dart';

import 'chat_screen.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  int _currentTab = 0;
  String _screenTitle = 'Learning';
  
  final List<Widget> screens = [
    StudyHomeScreen(),
    FavoriteWordsScreen(),
    ChatScreen(),
    PlayGameScreen(),
  ];

  Widget _currentScreen = StudyHomeScreen();
  final PageStorageBucket _bucket = PageStorageBucket();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text(_screenTitle),
        leading: GestureDetector(
          onTap: (){print('Ontap');},
          child: Icon(Icons.menu),
        ),
        actions: <Widget>[
          MaterialButton(
            child: Icon(Icons.person, color: Colors.white,),
            onPressed: (){print('TapPerson');},
          ),
        ],
      ),

      body: PageStorage(
        child: _currentScreen,
        bucket: _bucket,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        child: FloatingActionButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageIcon(AssetImage('assets/sprites/LookUpIcon.png'),
                color: Colors.white,),
              Text('Search'),
            ],
          ),

          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SearchWordScreen()),
            );
          },
          tooltip: 'Look up',
          elevation: 2.0,
        ),
        width: 70,
        height: 70,
      ),
      bottomNavigationBar: createBottomAppBar(),
    );
  }

  void onTabTapped(int index){
    setState(() {
      _currentTab = index;
    });
  }

  BottomAppBar createBottomAppBar(){
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 5.0,

        child: Container(
          height: 70,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              // left tab bar icons
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Study Icon
                    MaterialButton(
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width / 5,
                      onPressed: () {
                        setState(() {
                          _currentScreen = StudyHomeScreen();
                          _currentTab = 0;
                          _screenTitle = 'Learning';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.book,
                            color: _currentTab == 0 ? Colors.blue : Colors
                                .grey,),
                          Text('Study', style: TextStyle(color: _currentTab ==
                              0 ? Colors.blue : Colors.grey,),),
                        ],),
                    ),

                    // Play Icon
                    MaterialButton(
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width / 5,
                      onPressed: () {
                        setState(() {
                          _currentScreen = PlayGameScreen();
                          _currentTab = 1;
                          _screenTitle = 'Play';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.videogame_asset,
                            color: _currentTab == 1 ? Colors.blue : Colors
                                .grey,),
                          Text('Play', style: TextStyle(color: _currentTab ==
                              1 ? Colors.blue : Colors.grey,),),
                        ],),
                    )
                  ],
                ),

                // Right tab bar icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Favorite icon
                    MaterialButton(
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width / 5,
                      onPressed: () {
                        setState(() {
                          _currentScreen =
                              FavoriteWordsScreen(); // if user taps on this dashboard tab will be active
                          _currentTab = 2;
                          _screenTitle = 'Favorite words';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            color: _currentTab == 2 ? Colors.blue : Colors
                                .grey,
                          ),
                          Text(
                            'Favorite',
                            style: TextStyle(
                              color: _currentTab == 2 ? Colors.blue : Colors
                                  .grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Chat icon
                    MaterialButton(
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width / 5,
                      onPressed: () {
                        setState(() {
                          _currentScreen =
                              ChatScreen(); // if user taps on this dashboard tab will be active
                          _currentTab = 3;
                          _screenTitle = 'Chat';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.chat,
                            color: _currentTab == 3 ? Colors.blue : Colors
                                .grey,
                          ),
                          Text(
                            'Chat',
                            style: TextStyle(
                              color: _currentTab == 3 ? Colors.blue : Colors
                                  .grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ]
          ),
        )
    );
  }
}
