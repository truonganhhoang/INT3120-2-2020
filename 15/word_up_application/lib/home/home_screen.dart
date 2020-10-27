import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:word_up_application/home/account_page.dart';
import 'package:word_up_application/favorite_screen/favorite_words_screen.dart';
import 'package:word_up_application/game_screen/play_game_screen.dart';
import 'package:word_up_application/search_screen/search_word_screen.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/study_home_screen/study_home_screen.dart';
import 'package:word_up_application/user_profile_screen/user_profile_screen.dart';
import '../chat_screen/chat_screen.dart';

class Home extends StatefulWidget {
  @override
 // Home(Key key):super(key : key);
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  String _screenTitle = 'Learning';
  final String iconLookUpPath = 'assets/sprites/LookUpIcon.png';

  final List<Widget> screens = [
    StudyHomeScreen(),
    FavoriteWordsScreen(),
    ChatScreen(),
    PlayGameScreen(),
  ];

  Widget _currentScreen = StudyHomeScreen();
  final PageStorageBucket _bucket = PageStorageBucket();

  void openProfileUserScreen() {
    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: UserProfileScreen()));
  }

  void openChatScreen() {
    Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: ChatScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          title: new Text(_screenTitle),
          actions: <Widget>[
            MaterialButton(
              minWidth: 50,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                openProfileUserScreen();
              },
            ),
          ],
        ),
        drawer: AccountPage(),
        body: Container(
          child: PageStorage(
            child: _currentScreen,
            bucket: _bucket,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          child: FloatingActionButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageIcon(
                  AssetImage(iconLookUpPath),
                  color: Colors.white,
                ),
                Text('Search', style: TextStyle(fontSize: 15)),
              ],
            ),
            onPressed: () {
              setState(() {
                _currentScreen = SearchWordScreen();
                _currentTab = 4;
                _screenTitle = 'Search';
              });
            },
            tooltip: 'Look up',
            elevation: 2.0,
          ),
          width: 70,
          height: 70,
        ),
        bottomNavigationBar: createBottomAppBar(),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  BottomAppBar createBottomAppBar() {
    return BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 5.0,
        child: Container(
          height: 70,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ImageIcon(
                            AssetImage('assets/sprites/learnIcon.png'),
                            color: _currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'Study',
                            style: TextStyle(
                              fontSize: 1.9 * SizeConfig.heightMultiplier,
                              color:
                              _currentTab == 0 ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
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
                          Icon(
                            Icons.videogame_asset,
                            color: _currentTab == 1 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'Play',
                            style: TextStyle(
                              fontSize: 1.9 * SizeConfig.heightMultiplier,
                              color:
                              _currentTab == 1 ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
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
                          _screenTitle = 'Favorite';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            color: _currentTab == 2 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'Favorite',
                            style: TextStyle(
                              fontSize: 1.9 * SizeConfig.heightMultiplier,
                              color:
                              _currentTab == 2 ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Chat icon
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width / 5,
                      onPressed: () {
                        /*setState(() {
                          _currentScreen =
                              ChatScreen(); // if user taps on this dashboard tab will be active
                          _currentTab = 3;
                          _screenTitle = 'Chat';
                        });*/
                        openChatScreen();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.chat,
                            color: _currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'Chat',
                            style: TextStyle(
                              fontSize: 1.9 * SizeConfig.heightMultiplier,
                              color:
                              _currentTab == 3 ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ]),
        ));
  }
}
