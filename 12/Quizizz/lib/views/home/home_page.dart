import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  var _init = true;
  var _isLoading = false;
  List<Topic> listTopic;

  @override
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });
      API_Manager().fetchTopic().then((value) => listTopic = value).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
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
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: listTopic.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Topic topic = listTopic[index];
                      return ListQuiz(
                        topic: topic,
                        size: size,
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
                  hintText: "Enter a game code",
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
