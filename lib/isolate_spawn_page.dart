import 'dart:isolate';
import 'package:flutter/material.dart';

class IsolateSpawnPage extends StatelessWidget {
  const IsolateSpawnPage({super.key});

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
              //ReceivePort is to listen for the isolate to finish job
              final receivePort = ReceivePort();
              // here we are passing method name and sendPort instance from ReceivePort as listener
              await Isolate.spawn(
                  computationallyExpensiveTask, receivePort.sendPort);
              //It will listen for isolate function to finish
              receivePort.listen((sum) {
                print(sum);
              });
            },
          )
        ],
      ),
    );
  }
}

// this function should be either top level(outside class) or static method
void computationallyExpensiveTask(SendPort sendPort) {
  print('heavy work started');
  var sum = 0;
  for (var i = 0; i <= 1000000000; i++) {
    sum += i;
  }
  print('heavy work finished');
  //Remember there is no return, we are sending sum to listener defined before.
  sendPort.send(sum);
}
