import 'package:flutter/material.dart';
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

class CounterController extends StatelessWidget {
  final CounterProvider provider;

  const CounterController({Key key, this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterProvider>(
      create: (_) => provider,
      child: Consumer<CounterProvider>(
        builder: (_, provider, __) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                RaisedButton(
                  child: Icon(Icons.remove),
                  onPressed: () {
                    provider.decrease();
                  },
                ),
                Text("${provider.counter}"),
                RaisedButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    provider.increase();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void decrease() {
    _counter--;
    notifyListeners();
  }

  void increase() {
    _counter++;
    notifyListeners();
  }

  void clear() {
    _counter = 0;
    notifyListeners();
  }
}
