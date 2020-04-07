import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gameoflife/board.dart';

import 'game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Game Of Life',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int width = 1;
  int height = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          color: Colors.lightBlueAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Width",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              ValueWidget(size: width, onAdd: _addWidth, onSub: _subWidth),
              Text(
                "Height",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              ValueWidget(size: height, onAdd: _addHeight, onSub: _subHeight),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GamePage(width: width, height: height)));
                },
                child: Text("Start"),
                color: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addWidth() {
    setState(() {
      width++;
    });
  }

  void _subWidth() {
    setState(() {
      if (width > 1) {
        width--;
      }
    });
  }

  void _addHeight() {
    setState(() {
      height++;
    });
  }

  void _subHeight() {
    setState(() {
      if (height > 1) {
        height--;
      }
    });
  }
}

class ValueWidget extends StatelessWidget {
  final void Function() onAdd;
  final void Function() onSub;
  final int size;

  ValueWidget({this.size, this.onAdd, this.onSub});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: onAdd,
          icon: Icon(Icons.exposure_plus_1),
        ),
        Expanded(
            child: Center(
                child: Text("$size",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)))),
        IconButton(
          onPressed: onSub,
          icon: Icon(Icons.exposure_neg_1),
        )
      ],
    );
  }
}

class GamePage extends StatefulWidget {
  final int width;
  final int height;

  GamePage({this.width, this.height});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  Game game;

  Ticker _ticker;

  @override
  void initState() {
    super.initState();
    game = Game(board: Board.randomized(widget.width, widget.height));
    _ticker = createTicker(update);
    _ticker.start();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            for (int y = 0; y < widget.height; y++)
              Expanded(
                child: Row(
                  children: <Widget>[
                    for (int x = 0; x < widget.width; x++)
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          color: game.board.cells[y][x].alive
                              ? Colors.greenAccent
                              : Colors.redAccent,
                        ),
                      ))
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  void update(Duration elapsed) {
    if (elapsed.inMilliseconds >= 500) {
      setState(() {
        game.update();
        if (game.isEndReached()) {
          _ticker.stop();
        }
      });
    }
  }

  @override
  void dispose() {
    _ticker.stop();
    super.dispose();
  }
}
