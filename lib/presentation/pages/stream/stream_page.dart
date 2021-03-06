import 'package:flutter/material.dart';
import 'package:learning_app/application/counter/counter_stream.dart';
import 'package:learning_app/application/progress/progress_stream.dart';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  final counterStream = CounterStream();
  final progressStream = ProgressStream();

  @override
  void dispose() {
    counterStream.close();
    progressStream.close();

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
              "COUNTER STREAM",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          StreamBuilder<int>(
            stream: counterStream.stream,
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
            stream: progressStream.stream,
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
          counterStream.clear();
        },
      ),
    );
  }
}
