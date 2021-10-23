import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CheckFirst(),
    );
  }
}

class CheckFirst extends StatefulWidget {
  const CheckFirst({Key? key}) : super(key: key);

  @override
  CheckFirstState createState() => CheckFirstState();
}

class CheckFirstState extends State<CheckFirst> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> _isFirst;

  @override
  void initState() {
    super.initState();
    _isFirst = _prefs.then((SharedPreferences prefs) {
      return (prefs.getBool('isFirst') ?? true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
          future: _isFirst,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == true) {
                  _prefs.then((SharedPreferences prefs) =>
                      prefs.setBool('isFirst', false));
                  return const First();
                } else {
                  return const Text("outgo");
                }
            }
          }),
    );
  }
}
