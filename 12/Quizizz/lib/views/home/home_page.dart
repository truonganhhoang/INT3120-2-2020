import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiztest/views/components/quiz_list.dart';
import '../components/appbar.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/models/models.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiztest/bloC/topic/topic_bloc.dart';
import 'package:quiztest/bloC/topic/topic_event.dart';
import 'package:quiztest/bloC/topic/topic_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TopicBloc topicBloc;
  bool isAPICall = false;

  @override
  void initState() {
    super.initState();
    if (!isAPICall) {
      topicBloc = BlocProvider.of<TopicBloc>(context);
      topicBloc.add(FetchTopicEvent());
      isAPICall = true;
    }
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
            BlocListener(
              cubit: topicBloc,
              listener: (context, state) {
                if (state is TopicErrorState) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              child: BlocBuilder<TopicBloc, TopicState>(
                cubit: topicBloc,
                builder: (context, state) {
                  if (state is TopicInitState) {
                    print("Init state");
                    return SpinKitDualRing(color: Colors.blue);
                  } else if (state is TopicLoadingState) {
                    print("loading state");
                    return SpinKitDualRing(color: Colors.blue);
                  } else if (state is TopicLoadedState) {
                    print("Loaded state");
                    List<Topic> topics = state.topics ?? [];
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
                  } else if (state is TopicErrorState) {
                    return Text(state.message);
                  }
                },
              ),
            )
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
