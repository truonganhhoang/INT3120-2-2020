import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:word_up_application/size_config.dart';

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
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0);
    return FadeTransition(
        opacity: _animation,
        child: Container(
          child: Swiper(
            index: 0,
            itemWidth: SizeConfig.screenWidth - 2 * 64,
            layout: SwiperLayout.DEFAULT,
            itemCount: widget.listExamples.length,
            itemBuilder: (context, index) {
              return Container(
                child: Center(
                  child: Text(
                    widget.listExamples[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 2.5 * SizeConfig.heightMultiplier,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              );
            },
            pagination: SwiperPagination(
              margin: EdgeInsets.only(bottom: 0 * SizeConfig.heightMultiplier),
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.blue,
                size: 0.8 * SizeConfig.heightMultiplier,
                activeSize: 1* SizeConfig.heightMultiplier,
              ),
            ),
          ),
          height: 16 * SizeConfig.heightMultiplier,
        ));
  }
}
