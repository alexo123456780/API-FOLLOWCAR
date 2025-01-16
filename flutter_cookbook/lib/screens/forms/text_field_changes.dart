import 'package:flutter/material.dart';

class TextFieldChangesScreen extends StatefulWidget {
  const TextFieldChangesScreen({Key? key}) : super(key: key);

  @override
  _TextFieldChangesScreenState createState() => _TextFieldChangesScreenState();
}

class _TextFieldChangesScreenState extends State<TextFieldChangesScreen> {
  String _texto = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manejar Cambios en Campo de Texto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (texto) {
                setState(() {
                  _texto = texto;
                });
              },
              decoration: InputDecoration(
                labelText: 'Ingresa algún texto',
              ),
            ),
            SizedBox(height: 20),
            Text('Has ingresado: $_texto'),
          ],
        ),
      ),
    );
  }
}