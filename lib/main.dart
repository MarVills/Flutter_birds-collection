import 'package:flutter/material.dart';
import 'collections.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hummingbird Collections',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: CollectionPage(),
    );
  }
}
