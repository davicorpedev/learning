import 'package:flutter/material.dart';
import 'package:learning_app/application/counter/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterController extends StatelessWidget {
  final CounterProvider? provider;

  const CounterController({Key? key, this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterProvider?>(
      create: (_) => provider,
      child: Consumer<CounterProvider?>(
        builder: (_, provider, __) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  child: Icon(Icons.remove),
                  onPressed: () {
                    provider!.decrease();
                  },
                ),
                Text("${provider!.counter}"),
                ElevatedButton(
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
