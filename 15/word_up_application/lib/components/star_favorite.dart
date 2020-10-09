import 'package:flutter/material.dart';

class StarFavorite extends StatefulWidget {
  final int wordId;
  final double size;
  final bool isFavorite;

  StarFavorite({
    @required this.wordId,
    @required this.size,
    @required this.isFavorite,
  });
  @override
  State<StatefulWidget> createState() => _StarFavoriteStage();
}

class _StarFavoriteStage extends State<StarFavorite> {
  final String starFavoriteNotChosenIconPath =
      'assets/sprites/Favorite_NotChosen.png';
  final String starFavoriteChosenIconPath =
      'assets/sprites/Favorite_Chosen.png';
  String starIcon;
  bool isChosen = false;

  @override
  void initState() {
    super.initState();
    isChosen = widget.isFavorite;
    if(isChosen){
      starIcon = starFavoriteChosenIconPath;
    }
    else starIcon = starFavoriteNotChosenIconPath;
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        splashColor: Colors.transparent,
        minWidth: 40,
        onPressed: () {
          isChosen = !isChosen;
          setStatus(isChosen);
        },
        child: Image(
          image: AssetImage(starIcon),
          width: widget.size,
          height: widget.size,
        ),
      ),
    );
  }

  void setStatus(bool isFavorite) {
    if (isFavorite) {
      setState(() {
        starIcon = starFavoriteChosenIconPath;
      });
      addThisWordToFavoriteList();
    } else {
      setState(() {
        starIcon = starFavoriteNotChosenIconPath;
      });
      removeThisWordFromFavoriteList();
    }
  }

  void addThisWordToFavoriteList(){
    //To do
  }

  void removeThisWordFromFavoriteList(){
    //To do
  }
}
