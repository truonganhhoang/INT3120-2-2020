import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/components/star_favorite.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/size_config.dart';
import '../word.dart';

class ListKnewWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListKnewWords();
}

class _ListKnewWords extends State<ListKnewWords> {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  List<Word> words = new List();

  @override
  void initState() {
    super.initState();
    dbHelper.getListKnewWords().then((rows) {
      setState(() {
        rows.forEach((row) {
          words.add(row);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 4*SizeConfig.widthMultiplier, left: 4*SizeConfig.widthMultiplier),
      height: 78 * SizeConfig.heightMultiplier,
      child: ListView.builder(
          itemCount: words.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        '${words[position].word}',
                        style: TextStyle(
                            fontSize: 4 * SizeConfig.heightMultiplier,
                            color: Colors.green[300]),
                      ),
                    ),
                    subtitle: Center(
                      child: Text('${words[position].pronounceUK}',
                          style: TextStyle(
                              fontSize: 3 * SizeConfig.heightMultiplier)),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage('assets/sprites/sound_play_icon.png'),
                        size: 4.5 * SizeConfig.heightMultiplier,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: StarFavorite(
                        wordId: null,
                        size: 4 * SizeConfig.heightMultiplier,
                        isFavorite: true),
                  ),
                )
              ],
            );
          }),
    );
  }
}
