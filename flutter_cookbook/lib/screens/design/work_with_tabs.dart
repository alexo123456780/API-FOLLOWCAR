import 'package:flutter/material.dart';

class WorkWithTabsScreen extends StatelessWidget {
  const WorkWithTabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trabajar con Pestañas'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Pestaña de Coche')),
            Center(child: Text('Pestaña de Tránsito')),
            Center(child: Text('Pestaña de Bicicleta')),
          ],
        ),
      ),
    );
  }
}