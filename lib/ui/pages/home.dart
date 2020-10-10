import 'package:firedash/utils/dialog_service.dart';
import 'package:firedash/utils/service_locator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireDash'),
        centerTitle: true,
        actions: [
          IconButton(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LicensePage(
                      applicationIcon: FlutterLogo(),
                      applicationName: 'FireDash',
                      applicationVersion: 'v0.1',
                      applicationLegalese:
                          'This application is implemented for training on Firebase features...',
                    ),
                  ));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/babies'),
              child: Text(
                'Baby Names',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () =>
                  getIt<DialogService>().featureNotAvailableDialog(context),
              child: Text(
                'Firebase auth',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
