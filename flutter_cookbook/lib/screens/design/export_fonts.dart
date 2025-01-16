import 'package:flutter/material.dart';

class ExportFontsScreen extends StatelessWidget {
  const ExportFontsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exportar Fuentes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Este texto usa la fuente Raleway',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Este texto usa la fuente RobotoMono',
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}