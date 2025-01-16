import 'package:flutter/material.dart';

class DisplaySnackbarScreen extends StatelessWidget {
  const DisplaySnackbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mostrar un Snackbar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text('¡Genial! Un SnackBar!'),
              action: SnackBarAction(
                label: 'Deshacer',
                onPressed: () {
                  // Código para deshacer el cambio.
                },
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Mostrar SnackBar'),
        ),
      ),
    );
  }
}