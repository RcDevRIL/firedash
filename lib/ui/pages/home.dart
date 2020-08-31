import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireDash'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
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
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () => Navigator.pushNamed(context, '/babies'),
              color: Colors.blueGrey,
              child: Text('Babies vote'),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.blueGrey,
              child: Text('Firebase auth'),
            ),
          ],
        ),
      ),
    );
  }
}
