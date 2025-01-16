import 'package:flutter/material.dart';

class UseThemesScreen extends StatelessWidget {
  const UseThemesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Usar Temas'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Botón Elevado'),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {},
                child: Text('Botón con Contorno'),
              ),
              SizedBox(height: 20),
              Text('Este texto usa el estilo de texto del tema'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}