import 'package:flutter/material.dart';

class FadeInImagesScreen extends StatelessWidget {
  const FadeInImagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desvanecer Imágenes'),
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/loading.gif',
          image: 'https://picsum.photos/250?image=9',
        ),
      ),
    );
  }
}