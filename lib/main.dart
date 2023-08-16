import 'package:flutter/material.dart';
import 'package:requests_inspector/requests_inspector.dart';

import 'features/home/home_page.dart';

const inspectorEnabled = true;

void main() {
  runApp(const RequestsInspector(
    enabled: inspectorEnabled,
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
