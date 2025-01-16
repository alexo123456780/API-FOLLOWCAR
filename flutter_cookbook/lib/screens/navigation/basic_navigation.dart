import 'package:flutter/material.dart';

class BasicNavigationScreen extends StatelessWidget {
  const BasicNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegación Básica'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Ir a la segunda pantalla'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
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