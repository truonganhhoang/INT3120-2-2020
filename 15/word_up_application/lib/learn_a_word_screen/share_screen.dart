import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';
import 'package:word_up_application/size_config.dart';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:word_up_application/word.dart';

class ShareScreen extends StatefulWidget {
  final Word wordShare;

  ShareScreen({
    this.wordShare,
  }) : assert(wordShare != null);

  @override
  ShareScreenState createState() => ShareScreenState();
}

class ShareScreenState extends State<ShareScreen> {
  Widget buildImage(Uint8List bytes) =>
      bytes != null ? Image.memory(bytes) : Container();

  @override
  void initState() {
    super.initState();
  }

  String text = '';
  String subject = '';
  String imgPath = '';
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerText = TextEditingController()
      ..text = "Word:   " +
          widget.wordShare.word +
          "\n\n" +
          "Examples: " +
          "\n" +
          widget.wordShare.examples[0] +
          "\n" +
          widget.wordShare.examples[1] +
          "\n\n" +
          "Quotes Example: " +
          "\n" +
          widget.wordShare.quotes[0];
    TextEditingController controllerSubject = TextEditingController()
      ..text = "New word:     " + widget.wordShare.word;
    _onShare(BuildContext context) async {
      // A builder is used to retrieve the context immediately
      // surrounding the RaisedButton.
      //
      // The context's `findRenderObject` returns the first
      // RenderObject in its descendent tree when it's not
      // a RenderObjectWidget. The RaisedButton's RenderObject
      // has its position and size after it's built.
      final RenderBox box = context.findRenderObject();
      if (text.isEmpty) text = controllerText.text;
      if (subject.isEmpty) subject = controllerSubject.text;
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

    return MaterialApp(
      title: 'Share Demo',
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: new Text('Share Demo'),
          ),
          body: Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      controller: controllerSubject,
                      decoration: const InputDecoration(
                        labelText: 'Share Subject:',
                        labelStyle: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 28),
                        hintText: 'Enter subject to share (optional)',
                      ),
                      style:
                          TextStyle(fontSize: 2.4 * SizeConfig.textMultiplier),
                      maxLines: 2,
                      onChanged: (String value) => setState(() {
                        subject = value;
                      }),
                    ),
                    TextField(
                      controller: controllerText,
                      decoration: const InputDecoration(
                        labelText: 'Share Content:',
                        labelStyle: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 28),
                        hintText: 'Enter some text and/or link to share',
                      ),
                      style: TextStyle(
                        fontSize: 2.4 * SizeConfig.textMultiplier,
                      ),
                      maxLines: 8,
                      onChanged: (String value) => setState(() {
                        text = value;
                      }),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 12.0)),
                    //ImagePreviews(imagePaths, onDelete: _onDeleteImage),

                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text(
                        "Add image",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 2.8 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.w500),
                      ),
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
                          color: Colors.grey,
                          child: const Text(
                            'Share',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: text.isEmpty &&
                                  imagePaths.isEmpty &&
                                  subject.isEmpty
                              ? null
                              : () => _onShare(context),
                        );
                      },
                    ),
                  ],
                ),
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
}
