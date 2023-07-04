import 'dart:math';

import 'package:devangels_defer_init/devangels_defer_init.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyService {
  MyService._();

  static MyService? _instance;

  static MyService get instance => _instance!;

  static Future<MyService> init() async {
    if (_instance == null) {
      await Future.delayed(const Duration(seconds: 5));
      _instance = MyService._();
    }
    return _instance!;
  }

  bool isLoggedIn() {
    return Random(DateTime.now().millisecondsSinceEpoch).nextBool();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('DevAngels Demo'),
      ),
      body: DeferInit(
        create: () async {
          await MyService.init();
          if (MyService.instance.isLoggedIn()) {
            return const Center(
              child: Text(
                'Logged In',
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Not Logged In',
              ),
            );
          }
        },
        emptyWidget: const Center(
          child: Text(
            'No Data',
          ),
        ),
      ),
    );
  }
}
