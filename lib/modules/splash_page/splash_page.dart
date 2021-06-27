import 'package:flutter/material.dart';
import 'package:payflownlw/shared/auth/auth_controller.dart';
import 'package:payflownlw/shared/themes/app_images.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();

    authController.currentUser(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Center(child: Image.asset(AppImages.union)),
            Center(child: Image.asset(AppImages.logoFull))
          ],
        ),
      ),
    );
  }
}
