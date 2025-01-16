import 'package:flutter/material.dart';

class LongListsScreen extends StatelessWidget {
  const LongListsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas Largas'),
      ),
      body: ListView.builder(
        itemCount: 10000,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Elemento $index'),
          );
        },
      ),
    );
  }
}