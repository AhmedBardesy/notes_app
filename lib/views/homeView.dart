import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [Icon(Icons.search)],
        title: Text(
          'Notes',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
