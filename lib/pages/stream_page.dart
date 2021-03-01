import 'dart:async';

import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  final number = Number();
  final progress = Progress();

  @override
  void dispose() {
    number.close();
    progress.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stream practice")),
      body: Column(
        children: [
          ListTile(
            title: Text(
              "TIMER COUNT STREAM",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          StreamBuilder<int>(
            stream: number.stream,
            builder: (_, snapshot) {
              return ListTile(
                title: Text(
                  "${snapshot.data}",
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              "PROGRESS STREAM",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          StreamBuilder<double>(
            stream: progress.stream,
            builder: (_, snapshot) {
              return ListTile(
                title: LinearProgressIndicator(
                  value: snapshot.data,
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          number.clear();
        },
      ),
    );
  }
}

class Number {
  int _count = 0;

  Timer _timer;

  final _controller = StreamController<int>();

  Number() {
    _sink.add(_count);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _count++;
      _sink.add(_count);
    });
  }

  Stream<int> get stream => _controller.stream;

  StreamSink<int> get _sink => _controller.sink;

  void clear() {
    _count = 0;
    _sink.add(0);
  }

  void close() {
    _controller.close();
    _timer.cancel();
  }
}

class Progress {
  static const double max = 1;

  double _progress = 0;

  Timer _timer;

  final _controller = StreamController<double>();

  Progress() {
    _sink.add(_progress);

    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_progress > max) {
        _progress = 0;
      } else {
        _progress = _progress + 0.01;
      }

      _sink.add(_progress);
    });
  }

  Stream<double> get stream => _controller.stream;

  StreamSink<double> get _sink => _controller.sink;

  void close() {
    _controller.close();
    _timer.cancel();
  }
}
