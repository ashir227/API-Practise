import 'package:apiis/Apis.dart';
import 'package:apiis/model/pracapi.dart';
import 'package:apiis/new.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Prac());
  }
}
