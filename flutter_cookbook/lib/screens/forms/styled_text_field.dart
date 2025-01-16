import 'package:flutter/material.dart';

class StyledTextFieldScreen extends StatelessWidget {
  const StyledTextFieldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campo de Texto Estilizado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Ingresa tu nombre',
            hintText: 'Alejandro Montero Chavez',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}