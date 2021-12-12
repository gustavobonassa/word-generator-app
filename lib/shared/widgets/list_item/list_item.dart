import 'package:flutter/material.dart';

import 'package:whatword/shared/models/word_model.dart';

class ListItemWidget extends StatelessWidget {
  final WordModel data;
  final VoidCallback onPressed;
  const ListItemWidget({Key? key, required this.data, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(data.word!),
        subtitle: Text(data.translation!),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
