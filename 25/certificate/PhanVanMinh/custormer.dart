import 'package:flutter/material.dart';

class Custormer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin khách hàng"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/new.png'))),
                      child: FlatButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () {},
                      ),
                    ),
                    Text("New Creation")
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/ass.png'))),
                      child: FlatButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () {},
                      ),
                    ),
                    Text("Assignment")
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/inquiry.png'))),
                      child: FlatButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () {},
                      ),
                    ),
                    Text("Inquiry List")
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60,20,60,20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/sales.png'))),
                      child: FlatButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () {},
                      ),
                    ),
                    Text("Sales List ")
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/lost.png'))),
                      child: FlatButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () {},
                      ),
                    ),
                    Text("Lost list")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
