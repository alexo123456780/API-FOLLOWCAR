import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImagesScreen extends StatelessWidget {
  const CachedImagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imágenes en Caché'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: 'https://picsum.photos/250?image=9',
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}