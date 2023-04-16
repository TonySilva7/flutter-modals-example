import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modais_flutter/models/my_attr_float_btn.dart';
import 'package:modais_flutter/screens/screen01.dart';
import 'package:modais_flutter/screens/screen02.dart';
import 'package:modais_flutter/widgets/list_floating_btn.dart';
import 'package:modais_flutter/widgets/my_drawer.dart';
import 'package:modais_flutter/widgets/my_float_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          '/tela1': (context) => const Screen01(title: 'Tela 1'),
          '/tela2': (context) => const Screen02(title: 'Tela 2'),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter(BuildContext context) {
    setState(() {
      _counter = 0;
    });

    Navigator.of(context).pop();
  }

  void _showErrorDialog(BuildContext context, List<String> msg) {
    if (Platform.isIOS) {
      showDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.warning_rounded, color: Colors.red),
              const SizedBox(width: 7),
              Text(msg.first),
            ],
          ),
          content: Text(msg[1]),
          actions: [
            TextButton(
              onPressed: () => _resetCounter(context),
              child: Text(
                msg.last,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      );
      return;
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Row(
            children: [
              const Icon(Icons.warning_rounded, color: Colors.red),
              const SizedBox(width: 7),
              Text(msg.first),
            ],
          ),
          content: Text(msg[1]),
          backgroundColor: Colors.amber.withOpacity(0.9),
          actions: [
            TextButton(
              onPressed: () => _resetCounter(context),
              child: Text(
                msg.last,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      );
    }
  }

  void _modalBottomSheet(BuildContext context, List<String> msg) {
    showModalBottomSheet(
      backgroundColor: Colors.pink.withOpacity(0.9),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          child: Column(
            children: [
              Text(
                msg.first,
                style: TextStyle(fontSize: 24.0, color: Colors.white.withOpacity(0.8)),
              ),
              TextButton(
                onPressed: _incrementCounter,
                child: Text(
                  msg.last,
                  style: const TextStyle(color: Colors.amber, fontSize: 18.0),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _handleSnackBar(BuildContext context, List<String> msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg.first),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.purple.withOpacity(0.8),
        action: SnackBarAction(
          label: msg.last,
          onPressed: _decrementCounter,
          textColor: Colors.black87,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Clique nos botões para interagir',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: ListFloatingBtn(
        myAttributes: [
          MyAttrFloatButton(
            myHeroKey: const ObjectKey('fab0'),
            onPressed: () => _modalBottomSheet(context, ['Meu modal de base', 'Increment +']),
            tooltip: 'Increment',
            myIcon: Icons.add,
            titleButton: 'Incrementar',
          ),
          MyAttrFloatButton(
            myHeroKey: const ObjectKey('fab1'),
            onPressed: () => _handleSnackBar(context, ['Diminuindo...', 'DIMINUIR']),
            tooltip: 'Decrement',
            myIcon: Icons.remove,
            titleButton: 'Decrementar',
          ),
          MyAttrFloatButton(
            myHeroKey: const ObjectKey('fab2'),
            onPressed: () => _showErrorDialog(context, ['Resetar', 'Tem certeza que deseja resetar?', 'Manda Vê']),
            tooltip: 'Reset',
            myIcon: Icons.refresh,
            titleButton: 'Nada',
          ),
        ],
      ),
    );
  }
}
