import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ShowExamples extends StatefulWidget {
  final List<String> listExamples;

  ShowExamples({
    @required this.listExamples,
  }) : assert(listExamples != null);
  @override
  State<StatefulWidget> createState() => _ShowExamplesState();
}

class _ShowExamplesState extends State<ShowExamples>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0);
    return FadeTransition(
      opacity: _animation,
      child: Text(
        widget.listExamples[0],
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
