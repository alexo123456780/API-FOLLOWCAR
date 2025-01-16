import 'package:flutter/material.dart';

class ReturnDataScreen extends StatelessWidget {
  const ReturnDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo de Devolución de Datos'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _navigateAndDisplaySelection(context);
          },
          child: const Text('¡Elige una opción, cualquier opción!'),
        ),
      ),
    );
  }

  void _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elige una opción'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, '¡Sí!');
                },
                child: const Text('¡Sí!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'No.');
                },
                child: const Text('No.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}