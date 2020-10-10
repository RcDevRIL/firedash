import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final Widget title;
  final Widget content;

  const InfoDialog({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actionsPadding: const EdgeInsets.all(12.0),
      actions: [
        FlatButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
          child: Text(
            'OK',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
