import 'package:flutter/material.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/views/search/search-api.dart';
import '../components/appbar.dart';

const List<Color> activeColor = [Colors.white, Colors.pinkAccent, Colors.grey];
// const List<String> filterTitles = ["Grade", "Subject", "Number of questions"];

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isFiltered = false;
  int selectedTitle = 0;
  List<Map> filterTitles = [
    {"isSelected": true, "title": "Grade", "isChosen": false},
    {"isSelected": false, "title": "Subject", "isChosen": false},
    {"isSelected": false, "title": "Number of questions", "isChosen": false}
  ];
  List<List<Map>> criterias = [
    [
      {"isSelected": false, "title": "Elementary"},
      {"isSelected": false, "title": "Middle School"},
      {"isSelected": false, "title": "High School"},
      {"isSelected": false, "title": "University"}
    ],
    [
      {"isSelected": false, "title": "Math"},
      {"isSelected": false, "title": "English"},
      {"isSelected": false, "title": "History"},
      {"isSelected": false, "title": "Geography"},
      {"isSelected": false, "title": "Biology"},
      {"isSelected": false, "title": "Chemistry"},
      {"isSelected": false, "title": "physics"}
    ],
    [
      {"isSelected": false, "title": "1-10"},
      {"isSelected": false, "title": "11-20"},
      {"isSelected": false, "title": "20+"}
    ]
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: CustomAppBar(
          namePage: "Search",
          height: size.height,
        ),
        resizeToAvoidBottomPadding: false,
        body: Visibility(
          maintainSize: false,
          maintainAnimation: false,
          maintainInteractivity: false,
          maintainSemantics: false,
          replacement: SearchFilter(
            onTap: () {
              setState(() {
                isFiltered = !isFiltered;
              });
            },
          ),
          visible: isFiltered,
          child: Column(
            children: [
              Container(
                height: 50,
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isFiltered = !isFiltered;
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        "Filter",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: size.height * 0.65,
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 2, color: Colors.pinkAccent),
                              right: BorderSide(
                                  width: 2, color: Colors.pinkAccent),
                              bottom: BorderSide(
                                  width: 2, color: Colors.pinkAccent))),
                      child: SizedBox.expand(
                        child: ListView.builder(
                          itemCount: filterTitles.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListFilter(
                                title: filterTitles[index]['title'],
                                isSelected: filterTitles[index]['isSelected'],
                                isChosen: filterTitles[index]['isChosen'],
                                onTap: () {
                                  for (int i = 0;
                                      i < filterTitles.length;
                                      i++) {
                                    if (filterTitles[i]['isSelected'] == true &&
                                        i != index) {
                                      filterTitles[i]['isSelected'] = false;
                                    }
                                  }
                                  if (!filterTitles[index]['isSelected'])
                                    filterTitles[index]['isSelected'] =
                                        !filterTitles[index]['isSelected'];
                                  setState(() {
                                    selectedTitle = index;
                                  });
                                });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.55,
                      child: ListView.builder(
                        itemCount: criterias[selectedTitle].length,
                        itemBuilder: (context, index) {
                          return ListDetail(
                            onTap: () {
                              for (int i = 0;
                                  i < criterias[selectedTitle].length;
                                  i++) {
                                if (criterias[selectedTitle][i]['isSelected'] ==
                                        true &&
                                    i != index) {
                                  criterias[selectedTitle][i]['isSelected'] =
                                      false;
                                }
                              }
                              setState(() {
                                criterias[selectedTitle][index]['isSelected'] =
                                    !criterias[selectedTitle][index]
                                        ['isSelected'];
                                if (criterias[selectedTitle][index]
                                    ['isSelected']) {
                                  filterTitles[selectedTitle]['isChosen'] =
                                      true;
                                } else
                                  filterTitles[selectedTitle]['isChosen'] =
                                      false;
                              });
                            },
                            criteria: criterias[selectedTitle][index]['title'],
                            isSelected: criterias[selectedTitle][index]
                                ['isSelected'],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: TextButton(
                    onPressed: null,
                    child: Text(
                      "APPLY",
                      style: TextStyle(color: Colors.purple, fontSize: 18),
                    )),
              )
            ],
          ),
        ));
  }
}

class ListDetail extends StatefulWidget {
  const ListDetail({
    Key key,
    this.criteria,
    this.isSelected,
    this.onTap,
  }) : super(key: key);
  final String criteria;
  final bool isSelected;
  final Function onTap;
  @override
  _ListDetailState createState() => _ListDetailState();
}

class _ListDetailState extends State<ListDetail> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            color: widget.isSelected ? activeColor[2] : activeColor[0]),
        alignment: Alignment.centerLeft,
        height: 40,
        padding: EdgeInsets.only(top: 5, left: 30),
        child: Text(
          widget.criteria,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class ListFilter extends StatefulWidget {
  const ListFilter({
    Key key,
    this.title,
    this.onTap,
    this.isSelected,
    this.isChosen,
  }) : super(key: key);

  final String title;
  final Function onTap;
  final bool isSelected;
  final bool isChosen;

  @override
  _ListFilterState createState() => _ListFilterState();
}


  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  Future<List<Quiz>> searchResults;
  bool showSearchResults = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 2,
                      offset: Offset(0, 0),
                      color: Colors.black.withOpacity(0.25))
                ]),
            child: TextField(
                onChanged: (value) {},
                onSubmitted: (String value) {
                  if (value != '') {
                    searchResults = API_Manager().searchQuiz(value);
                    setState(() {
                      showSearchResults = true;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: "Search for quizzes",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  enabledBorder: InputBorder.none,
                )),
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 26,
                width: 71,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey)),
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      image: AssetImage("assets/icons/filter.png"),
                      height: 10,
                      width: 10,
                      color: Colors.purple,
                    ),
                    Text(
                      "Filter",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            maintainAnimation: false,
            maintainInteractivity: false,
            maintainSemantics: false,
            maintainSize: false,
            maintainState: false,
            visible: showSearchResults,
            child: FutureBuilder(
                future: searchResults,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Quiz> quizzes = snapshot.data ?? [];
                    return SearchResults(
                      size: size,
                      quizzes: quizzes,
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else
                    return CircularProgressIndicator();
                }),
          )
        ],
      ),
    );
  }
}
