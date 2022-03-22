import 'package:flutter/material.dart';
import 'collections.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAMvIA98l_dTQHVJi84zOJArC_BMLC-Lkw",
        authDomain: "bird-collections.firebaseapp.com",
        projectId: "bird-collections",
        storageBucket: "bird-collections.appspot.com",
        messagingSenderId: "808990573765",
        appId: "1:808990573765:web:ebdd202afdbb5140a1dcac"),
  );

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
