import 'dart:async';

class CounterStream {
  int _count = 0;

  late Timer _timer;

  final _controller = StreamController<int>();

  CounterStream() {
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
