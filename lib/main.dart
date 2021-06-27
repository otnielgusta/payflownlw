import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';

import 'app_widget.dart';
import 'modules/login/login_page.dart';

void main() {
  runApp(AppFireBase());
}

class AppFireBase extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppFireBaseState createState() => _AppFireBaseState();
}

class _AppFireBaseState extends State<AppFireBase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Material(
              child: Center(
                child: Text(
                  "Não foi possivel inicializar o Firebase",
                  textDirection: TextDirection.ltr,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return AppWidget();
          } else {
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
