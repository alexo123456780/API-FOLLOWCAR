import 'package:flutter/material.dart';

class UseCustomFontsScreen extends StatelessWidget {
  const UseCustomFontsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usar Fuentes Personalizadas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Este texto usa la fuente predeterminada',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Este texto usa una fuente personalizada (Raleway)',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}