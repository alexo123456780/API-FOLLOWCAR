import 'package:flutter/material.dart';

class PassArgumentsScreen extends StatelessWidget {
  const PassArgumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pasar Argumentos'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Navegar a pantalla que acepta argumentos'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/passArguments',
              arguments: ScreenArguments(
                'Pantalla de Aceptar Argumentos',
                'Este mensaje se extrae en el método build.',
              ),
            );
          },
        ),
      ),
    );
  }
}

class AcceptArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}