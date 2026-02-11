import 'dart:async';

import 'package:app/di/injector.dart';
import 'package:core/models/photovoltaic/photovoltaic_status.dart';
import 'package:core/repositories/photovoltaic_repository.dart';
import 'package:flutter/material.dart';

void main() async {
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final StreamSubscription<PhotovoltaicStatus> _subscription;
  PhotovoltaicStatus? _status;

  @override
  void initState() {
    super.initState();
    // TODO: Move this to a separate widget and use a BLoC or similar to manage the state instead of directly listening to the stream in the widget.
    final repo = getIt<PhotovoltaicRepository>();
    _subscription = repo.getPhotovoltaicStatusStream().listen((status) {
      setState(() => _status = status);
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          _status?.name ?? '...',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
