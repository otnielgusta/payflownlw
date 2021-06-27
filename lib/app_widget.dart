import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflownlw/modules/bar_code_scanner/bar_code_scanner_page.dart';
import 'package:payflownlw/modules/home_page/home_page.dart';
import 'package:payflownlw/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflownlw/modules/splash_page/splash_page.dart';
import 'package:payflownlw/shared/models/user_model.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';

import 'modules/login/login_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/home": (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        "/login": (context) => LoginPage(),
        "/splash": (context) => SplashPage(),
        "/barcode_scanner": (context) => BarCodeScannerPage(),
        "/insert_boleto": (context) => InserTBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : "",
            ),
      },
    );
  }
}
