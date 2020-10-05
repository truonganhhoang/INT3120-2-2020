import 'package:flutter/material.dart';

class MyCustomCard extends StatelessWidget {
  MyCustomCard(this.weekNumber);

  final int weekNumber;

  final makeCard = Material(
      child: InkWell(
          onTap: () {},
          child: Container(
            height: 75,
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: Colors.black)),
            ),
          )));

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: this.weekNumber,
      itemBuilder: (BuildContext context, int index) {
        return makeCard;
      },
    );
  }
}
