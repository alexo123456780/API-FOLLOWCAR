import 'package:flutter/material.dart';

class NamedRoutesScreen extends StatelessWidget {
  const NamedRoutesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutas con Nombre'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Ir a la segunda pantalla'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class SecondNamedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Pantalla'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Volver!'),
        ),
      ),
    );
  }
}