import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class MyAnimatedIcon extends StatefulWidget {
  @override
  _MyAnimatedIconState createState() => _MyAnimatedIconState();
}

class _MyAnimatedIconState extends State<MyAnimatedIcon> {
  final riveFileName = 'lib/assets/Map.riv';
  Artboard _artBoard;

  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      // Select an animation by its name
      setState(() => _artBoard = file.mainArtboard
        ..addController(
          SimpleAnimation('Swing the bell'),
        ));
    }
  }

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _artBoard != null
        ? Rive(
            artboard: _artBoard,
            fit: BoxFit.cover,
          )
        : Container();
  }
}
