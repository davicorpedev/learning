import 'dart:async';

class ProgressStream {
  static const double max = 1;

  double _progress = 0;

  Timer _timer;

  final _controller = StreamController<double>();

  ProgressStream() {
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
