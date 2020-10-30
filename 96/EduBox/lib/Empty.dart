import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print(showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 60))));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Empty'),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child: ClayContainer(
                width: 200,
                height: 400,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'gg',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.info,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Column(
                          children: List.generate(
                              5,
                              (index) =>
                                  Expanded(child: Text(index.toString()))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   height: 300,
            //   color: Colors.blue,
            //   child: Column(
            //     children: List.generate(5, (index) => Expanded(child: Text(index.toString()))),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
