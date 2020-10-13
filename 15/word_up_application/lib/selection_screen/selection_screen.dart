import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:word_up_application/size_config.dart';

import '../word.dart';

class SelectionScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen>{
  List<String> x = ['ddds', '112', 'mn', 'lk'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Select Words'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.yellow
              ),
            ),
            Container(
              height: 200,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  getABox(10, Colors.green),
                  getABox(20, Colors.red),
                  getABox(30, Colors.blue),
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey
              ),
              child: DragTarget(
                builder: (context, List<String> data, rj){
                  return Text('dss');
                },
                onAccept: (data){
                  if(data == 'truong'){
                    print('blabla');
                  }
                  setState(() {

                  });
                },
              ),
            ),
            //DragTarget(),
          ],
        ),
      ),
    );
  }
}

Widget getABox(double x, Color color){
  return Positioned(
    top: x,
    child: Draggable(
     // onDragStarted: ,
      feedback: Card(
        elevation: 10,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 50,
          width: 240,
        ),
      ),
      child: Card(
        elevation: 10,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
         // child: Text(x[]),
          height: 50,
          width: 240,
        ),
      ),
      childWhenDragging: Container(

      ),
      data: 'truong',
    ),

  );
}