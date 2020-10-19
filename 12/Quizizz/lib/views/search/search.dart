import 'package:flutter/material.dart';
import 'package:quiztest/views/search/search-api.dart';
import '../components/appbar.dart';

const List<Color> activeColor = [Colors.white, Colors.pinkAccent];
const List<String> filterTitles = ["Grade", "Subject", "Number of questions"];
const List<List<String>> criterias = [
  ["Elementary", "Middle School", "High School", "University"],
  [
    "Math",
    "English",
    "History",
    "Geography",
    "Biology",
    "Chemistry",
    "Physics"
  ],
  ["1-10", "11-20", "20+"]
];

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isFiltered = false;
  int selectedTitle = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: CustomAppBar(
          namePage: "Search",
          height: size.height,
        ),
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
                                size: size,
                                title: filterTitles[index],
                                onTap: () {
                                  setState(() {
                                    selectedTitle = index;
                                    print(selectedTitle);
                                  });
                                });
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                          children: criterias[selectedTitle]
                              .map((criteria) => Container(
                                    alignment: Alignment.centerLeft,
                                    height: 40,
                                    padding: EdgeInsets.only(left: 30, top: 5),
                                    child: Text(
                                      criteria,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ))
                              .toList()),
                    )
                  ],
                ),
              ),
              Container(
                child: TextButton(
                    onPressed: null,
                    child: Text(
                      "APPLY",
                      style:
                          TextStyle(color: Colors.purpleAccent, fontSize: 18),
                    )),
              )
            ],
          ),
        ));
  }
}

class ListFilter extends StatefulWidget {
  const ListFilter({
    Key key,
    @required this.size,
    this.title,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final String title;
  final Function onTap;

  @override
  _ListFilterState createState() => _ListFilterState();
}

class _ListFilterState extends State<ListFilter> {
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      focusColor: Colors.pinkAccent,
      hoverColor: Colors.black,
      child: Container(
        decoration:
            BoxDecoration(color: isPressed ? activeColor[0] : activeColor[1]),
        alignment: Alignment.centerLeft,
        height: 50,
        padding: EdgeInsets.only(left: 10, top: 5),
        child: Text(
          widget.title,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class SearchFilter extends StatelessWidget {
  const SearchFilter({
    Key key,
    this.onTap,
  }) : super(key: key);
  final Function onTap;
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
                decoration: InputDecoration(
                  hintText: "Search for quizzes",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  enabledBorder: InputBorder.none,
                )),
          ),
          Visibility(
            maintainAnimation: false,
            maintainInteractivity: false,
            maintainSemantics: false,
            maintainSize: false,
            maintainState: false,
            visible: false,
            replacement: SearchResults(
              size: size,
            ),
            child: GestureDetector(
              onTap: onTap,
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
          )
        ],
      ),
    );
  }
}
