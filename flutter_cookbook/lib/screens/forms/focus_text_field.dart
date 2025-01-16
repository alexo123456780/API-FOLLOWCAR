import 'package:flutter/material.dart';

class FocusTextFieldScreen extends StatefulWidget {
  const FocusTextFieldScreen({Key? key}) : super(key: key);

  @override
  _FocusTextFieldScreenState createState() => _FocusTextFieldScreenState();
}

class _FocusTextFieldScreenState extends State<FocusTextFieldScreen> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enfoque y Campos de Texto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Campo con autofoco',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              focusNode: myFocusNode,
              decoration: InputDecoration(
                labelText: 'Haz clic en el botón para enfocar',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                myFocusNode.requestFocus();
              },
              child: Text('Enfocar segundo campo'),
            ),
          ],
        ),
      ),
    );
  }
}