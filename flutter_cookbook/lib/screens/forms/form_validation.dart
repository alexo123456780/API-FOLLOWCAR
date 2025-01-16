import 'package:flutter/material.dart';

class FormValidationScreen extends StatefulWidget {
  const FormValidationScreen({Key? key}) : super(key: key);

  @override
  _FormValidationScreenState createState() => _FormValidationScreenState();
}

class _FormValidationScreenState extends State<FormValidationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validación de Formulario'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Ingresa tu correo electrónico',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu correo electrónico';
                }
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return 'Por favor ingresa un correo electrónico válido';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Procesando datos')),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}