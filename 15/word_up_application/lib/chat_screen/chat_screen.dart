import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/components/common_components.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                textInputAction: TextInputAction.send,
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Write a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void response(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/credentials.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    ChatMessage message = new ChatMessage(
      text: response.getMessage() ??
          new CardDialogflow(response.getListMessage()[0]).title,
      name: "Bot",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    if (text == "") return;
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "You",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    response(text);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: new Text('Chat Bot'),
        ),
        body: new Container(
          decoration: CommonComponents.background,
          child: Column(children: <Widget>[
            new Flexible(
                child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )),
            new Container(
              margin: EdgeInsets.fromLTRB(
                  2 * SizeConfig.heightMultiplier,
                  2 * SizeConfig.heightMultiplier,
                  2 * SizeConfig.heightMultiplier,
                  6 * SizeConfig.heightMultiplier),
              decoration: new BoxDecoration(
                border: Border.all(
                  color: Colors.grey[800],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: _buildTextComposer(),
            ),
          ]),
        ));
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: new CircleAvatar(
          radius: 3 * SizeConfig.textMultiplier,
          child: new Text('B',
              style: TextStyle(
                  fontSize: 3 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(this.name,
                style: new TextStyle(
                    color: Colors.grey[700],
                    fontSize: 2.7 * SizeConfig.textMultiplier)),
            new Container(
              constraints: BoxConstraints(
                  minWidth: 10, maxWidth: 0.65 * SizeConfig.screenWidth),
              padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(
                text,
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 2.7 * SizeConfig.textMultiplier),
              ),
              decoration: BoxDecoration(
                color: Colors.green[500],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(this.name,
                style: new TextStyle(
                    color: Colors.grey[700],
                    fontSize: 2.7 * SizeConfig.textMultiplier)),
            new Container(
              constraints: BoxConstraints(
                  minWidth: 25, maxWidth: 0.65 * SizeConfig.screenWidth),
              padding: EdgeInsets.all(6),
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(
                text,
                style: new TextStyle(fontSize: 2.7 * SizeConfig.textMultiplier),
              ),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(8),
              ),
            )
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(
            radius: 3 * SizeConfig.textMultiplier,
            child: new Text(
              this.name[0],
              style: new TextStyle(
                  fontSize: 3 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.bold),
            )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
