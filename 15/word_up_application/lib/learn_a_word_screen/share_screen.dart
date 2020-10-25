import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share/share.dart';
import 'fake_data.dart';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';

import 'learn_a_word_screen.dart';

class ShareScreen extends StatefulWidget {
  @override
  ShareScreenState createState() => ShareScreenState();
}

class ShareScreenState extends State<ShareScreen> {

  Widget buildImage(Uint8List bytes) =>
      bytes != null ? Image.memory(bytes) : Container();


  String text = '';
  String subject = '';
  String imgPath = '';
  List<String> imagePaths = [];
  TextEditingController controllerText = TextEditingController()..text = word1.word + "\n" + "Example: " + "\n" + word1.examples[0] + "\n" + word1.examples[1] + "\n" + "Quote Example: " + "\n" + word1.quotes[0] ;
  TextEditingController controllerSubject = TextEditingController()..text = "New word: " + word1.word;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Plugin Demo',
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }
            ),
            centerTitle: true,
            title: new Text('Share Demo'),

          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  TextField(
                    controller: controllerText,
                    decoration: const InputDecoration(
                      labelText: 'Share text:',
                      hintText: 'Enter some text and/or link to share',
                    ),
                    maxLines: 8,
                    onChanged: (String value) => setState(() {
                      text = value;
                    }),

                  ),
                  TextField(
                    controller: controllerSubject,
                    decoration: const InputDecoration(
                      labelText: 'Share subject:',
                      hintText: 'Enter subject to share (optional)',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      subject = value;
                    }),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  //ImagePreviews(imagePaths, onDelete: _onDeleteImage),

                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add image"),
                    onTap: () async {
                      final imagePicker = ImagePicker();
                      final pickedFile = await imagePicker.getImage(
                        source: ImageSource.gallery,
                      );
                      if (pickedFile != null) {
                        imgPath = pickedFile.path;
                        setState(() {
                          imagePaths.add(pickedFile.path);
                        });
                      }
                    },
                  ),
                  Image.asset(imgPath),
                  const Padding(padding: EdgeInsets.only(top: 15.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return RaisedButton(
                        color: Colors.blue[500],
                        child: const Text('Share'),
                        onPressed: text.isEmpty && imagePaths.isEmpty && subject.isEmpty
                            ? null
                            : () => _onShare(context),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
    });
  }

  _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the RaisedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The RaisedButton's RenderObject
    // has its position and size after it's built.
    final RenderBox box = context.findRenderObject();
    if(text.isEmpty) text = controllerText.text;
    if(subject.isEmpty) subject = controllerSubject.text;
    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }
}