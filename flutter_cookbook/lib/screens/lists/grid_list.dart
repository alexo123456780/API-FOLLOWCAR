import 'package:flutter/material.dart';

class GridListScreen extends StatelessWidget {
  const GridListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Cuadrícula'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Center(
            child: Text(
              'Elemento $index',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        }),
      ),
    );
  }
}