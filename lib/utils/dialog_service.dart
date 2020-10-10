import 'package:flutter/material.dart';

import 'package:firedash/ui/widgets/widgets.dart';

class DialogService {
  void buildInfoDialog(BuildContext context, {Widget title, Widget content}) {
    showDialog(
      context: context,
      builder: (context) => InfoDialog(
        title: title ??
            Icon(
              Icons.info,
              color: Theme.of(context).primaryColor,
              size: 54,
            ),
        content: content ?? SizedBox(),
      ),
    );
  }

  void featureNotAvailableDialog(BuildContext context) => buildInfoDialog(
        context,
        title: Icon(
          Icons.build_circle,
          color: Theme.of(context).primaryColor,
          size: 54,
        ),
        content: Text(
          'Fonctionnalité en cours d\'implémentation...',
          textWidthBasis: TextWidthBasis.parent,
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
