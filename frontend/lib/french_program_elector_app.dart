import 'package:flutter/material.dart';
import 'package:frontend/presentation/pages/home.dart';

class FrenchProgramElectorApp extends StatelessWidget {
  const FrenchProgramElectorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'French Program Elector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
