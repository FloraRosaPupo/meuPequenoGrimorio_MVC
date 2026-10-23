import 'package:flutter/material.dart';
import 'package:grimorio_arquitetura_mvc/features/library/presentation/dashboard.dart';

void main() {
  runApp(const Grimorio());
}

class Grimorio extends StatelessWidget {
  const Grimorio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grimório",
      theme: ThemeData.dark(useMaterial3: true),
      home: const Dashboard(),
    );
  }
}
