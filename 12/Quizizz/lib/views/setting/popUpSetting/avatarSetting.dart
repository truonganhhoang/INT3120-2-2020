import 'package:flutter/material.dart';

class AvatarList extends StatefulWidget {
  const AvatarList({
    Key key,
    this.title,
    this.image,
    this.isChosen,
  }) : super(key: key);
  final String title;
  final String image;
  final bool isChosen;
  @override
  _AvatarListState createState() => _AvatarListState();
}

class _AvatarListState extends State<AvatarList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.isChosen
            ? Colors.orangeAccent.withOpacity(0.5)
            : Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            width: 2,
            color: widget.isChosen
                ? Colors.orangeAccent
                : Color.fromRGBO(0, 0, 0, 0.25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            image: AssetImage('assets/icons/${widget.image}'),
            width: 55,
            height: 55,
            fit: BoxFit.contain,
          ),
          Container(
            child: Text(
              "${widget.title}",
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
