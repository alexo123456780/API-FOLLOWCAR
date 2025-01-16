import 'package:flutter/material.dart';

class FloatingAppBarScreen extends StatelessWidget {
  const FloatingAppBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text('Barra de Aplicación Flotante'),
            floating: true,
            flexibleSpace: Placeholder(),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Elemento $index'),
                );
              },
              childCount: 1000,
            ),
          ),
        ],
      ),
    );
  }
}