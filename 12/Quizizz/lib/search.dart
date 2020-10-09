import 'package:flutter/material.dart';
import 'components/appbar.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: CustomAppBar(
          namePage: "Search",
          height: size.height,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
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
              Align(
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
              )
            ],
          ),
        ));
  }
}
