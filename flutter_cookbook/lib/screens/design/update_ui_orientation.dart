import 'package:flutter/material.dart';

class UpdateUIOrientationScreen extends StatelessWidget {
  const UpdateUIOrientationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizar UI basada en Orientación'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout()
              : _buildLandscapeLayout();
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: [
        Expanded(child: _buildBox(Colors.red)),
        Expanded(child: _buildBox(Colors.green)),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(child: _buildBox(Colors.red)),
        Expanded(child: _buildBox(Colors.green)),
      ],
    );
  }

  Widget _buildBox(Color color) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'Esta es una caja ${color == Colors.red ? 'roja' : 'verde'}',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}