import 'package:flutter/material.dart';
import 'package:flutter_kanji_view/fklib/drawing_widget.dart';
import 'package:flutter_kanji_view/misc/converter.dart';

class Playground extends StatefulWidget {
  @override
  _PlaygroundState createState() {
    return _PlaygroundState();
  }
}

class _PlaygroundState extends State<Playground>
    with SingleTickerProviderStateMixin {
  var run = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    var char = getKanjiUnicode('雨');

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 400,
            height: 400,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(6),
            color: Colors.black12,
            child: KanjiViewer.svg("assets/vectors/" + char + ".svg",
                width: 300,
                height: 300,
                scaleToViewport: true,
                duration: new Duration(seconds: 6)),
          ),
          ElevatedButton(
            child: Text('Redraw'),
            onPressed: () {
              _controller.reset();
              _controller.forward();
            }
          ),
        ],
      ),
    );
  }
}
