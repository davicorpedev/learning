import 'package:flutter/material.dart';
import 'package:learning_app/application/counter/counter_provider.dart';
import 'package:learning_app/presentation/pages/provider/widgets/counter_controller.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  final counters = <CounterProvider>{
    CounterProvider(),
    CounterProvider(),
    CounterProvider(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider practice")),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: Text(
                "COUNTER PROVIDER EXAMPLE",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children:
                  counters.map((e) => CounterController(provider: e)).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          for (var item in counters) {
            item.clear();
          }
        },
      ),
    );
  }
}




