import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IsolatePage extends StatefulWidget {
  const IsolatePage({Key? key}) : super(key: key);

  @override
  State<IsolatePage> createState() => _IsolatePageState();
}

///Using Isolate to MultiThread
class _IsolatePageState extends State<IsolatePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const CircularProgressIndicator(),
          ElevatedButton(
            child: const Text('start'),
            onPressed: () async {
              final sum =
                  await compute(computationallyExpensiveTask, 1000000000);
              print(sum);
            },
          )
        ],
      ),
    );
  }
}

int computationallyExpensiveTask(int value) {
  var sum = 0;
  for (var i = 0; i <= value; i++) {
    sum += i;
  }
  print('finished');
  return sum;
}
