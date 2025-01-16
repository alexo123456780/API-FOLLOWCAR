import 'package:flutter/material.dart';

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

class MixedListScreen extends StatelessWidget {
  final List<ListItem> items = [
    HeadingItem('Encabezado 1'),
    MessageItem('Remitente 1', 'Cuerpo del mensaje 1'),
    MessageItem('Remitente 2', 'Cuerpo del mensaje 2'),
    HeadingItem('Encabezado 2'),
    MessageItem('Remitente 3', 'Cuerpo del mensaje 3'),
  ];

  MixedListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Mixta'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          if (item is HeadingItem) {
            return ListTile(
              title: Text(
                item.heading,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          } else if (item is MessageItem) {
            return ListTile(
              title: Text(item.sender),
              subtitle: Text(item.body),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}