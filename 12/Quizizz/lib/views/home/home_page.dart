import 'package:flutter/material.dart';
import 'package:quiztest/views/components/quiz_list.dart';
import '../components/appbar.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/models/models.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Topic>> _topics;

  @override
  void initState() {
    if (_topics == null) {
      _topics = API_Manager().fetchTopic();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: CustomAppBar(
          namePage: "Home",
          height: size.height,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            EnterCode(),
            FutureBuilder<List<Topic>>(
                future: _topics,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Topic> topics = snapshot.data ?? [];
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: topics.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Topic topic = topics[index];
                          return ListQuiz(
                            topic: topic,
                            size: size,
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return SpinKitDualRing(
                    color: Colors.blue,
                  );
                }),
          ]),
        ));
  }
}

class EnterCode extends StatelessWidget {
  const EnterCode({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 90,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 0))
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Column(children: [
          Container(
            height: 30,
            margin: EdgeInsets.only(bottom: 10),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5, left: 20),
                  hintText: "Enter a gane code",
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(209, 209, 209, 1)),
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromRGBO(146, 61, 199, 1),
                borderRadius: BorderRadius.circular(5)),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Join a game",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
