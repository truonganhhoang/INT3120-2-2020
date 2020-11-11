import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class MyAnimatedIcon extends StatefulWidget {
  @override
  _MyAnimatedIconState createState() => _MyAnimatedIconState();
}

class _MyAnimatedIconState extends State<MyAnimatedIcon> {
  final riveFileName = 'lib/assets/Map.riv';

  Future<Artboard> _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      // Select an animation by its name
      return file.mainArtboard
        ..addController(
          SimpleAnimation('Swing the bell'),
        );
    } else
      return null;
  }

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadRiveFile(),
        builder: (context, future) => future.data != null
            ? Container(
                height: MediaQuery.of(context).size.width / 2,
                width: MediaQuery.of(context).size.width / 2,
                child: Rive(
                  artboard: future.data,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.width / 2,
                width: MediaQuery.of(context).size.width / 2,
              ));
  }
}
