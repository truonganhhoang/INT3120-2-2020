import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/size_config.dart';

class SearchWordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchWordScreenState();
}

class _SearchWordScreenState extends State<SearchWordScreen> {
  String _url = "https://owlbot.info/api/v4/dictionary/";
  String _token = "09203f2e870ddd0e0b55f16d94040e7ab120137c";

  TextEditingController _controller = TextEditingController();

  StreamController _streamController;
  Stream _stream;

  Timer _debounce;

  _search() async {
    if (_controller.text == null || _controller.text.length == 0) {
      _streamController.add(null);
      return;
    }

    _streamController.add("waiting");

    Response response = await get(_url + _controller.text.trim(),
        headers: {"Authorization": "Token " + _token});

    if (response.statusCode == 200)
      _streamController.add(json.decode(response.body));
    else {
      _streamController.add("error");
    }
  }

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: CommonComponents.background,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                  top: 2 * SizeConfig.heightMultiplier,
                  right: 1.5 * SizeConfig.heightMultiplier,
                  left: 1.5 * SizeConfig.heightMultiplier),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                  boxShadow: kElevationToShadow[6],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        onChanged: (String text) {
                          if (_debounce?.isActive ?? false) _debounce.cancel();
                          _debounce =
                              Timer(const Duration(milliseconds: 1000), () {
                            _search();
                          });
                        },
                        controller: _controller,
                        decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.blue[300]),
                            contentPadding: const EdgeInsets.only(left: 24),
                            border: InputBorder.none),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 7.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                        ),
                        onPressed: () {
                          _search();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                  top: 1.5 * SizeConfig.heightMultiplier,
                  right: 1.5 * SizeConfig.heightMultiplier,
                  left: 1.5 * SizeConfig.heightMultiplier),
              child: Container(
                height: 74 * SizeConfig.heightMultiplier,
                child: StreamBuilder(
                  stream: _stream,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.topCenter,
                        child: Text('Enter a search word'),
                      );
                    }

                    if (snapshot.data == "waiting") {
                      return Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.topCenter,
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data == "error") {
                      return Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Enter the wrong word!!!',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      );
                    }

                    return ListView.builder(
                        itemCount: snapshot.data["definitions"].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                child: ListTile(
                                  leading: snapshot.data["definitions"][index]
                                              ["image_url"] ==
                                          null
                                      ? null
                                      : CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              snapshot.data["definitions"]
                                                  [index]["image_url"]),
                                        ),
                                  title: Text(_controller.text.trim() +
                                      " (" +
                                      snapshot.data["definitions"][index]
                                          ["type"] +
                                      ")"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(snapshot.data["definitions"][index]
                                    ["definition"]),
                              )
                            ],
                          );
                        });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
