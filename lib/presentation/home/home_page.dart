import 'package:flutter/material.dart';
import 'package:todo/presentation/routes/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
      ),
      body: const Placeholder(),
    );
  }
}
