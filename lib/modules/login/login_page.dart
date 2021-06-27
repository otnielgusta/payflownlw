import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflownlw/modules/login/login_controller.dart';
import 'package:payflownlw/shared/themes/app_images.dart';
import 'package:payflownlw/shared/themes/app_text_styles.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';
import 'package:payflownlw/shared/widgets/social_login/social_login_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.4,
              color: AppColors.primary,
            ),
            Positioned(
              top: size.height * 0.07,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.person,
                width: 208,
                height: 373,
              ),
            ),
            Positioned(
              top: size.height * 0.39,
              right: 0,
              left: 0,
              child: Image.asset(AppImages.retangle),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width,
                height: size.height * 0.7,
                child: Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.logomini,
                        width: 72,
                        height: 44,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: Text(
                          "Organize seus boletos em um só lugar",
                          textAlign: TextAlign.center,
                          style: TextStyles.titleHome,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: SocialLoginButtonWidget(
                          onTap: () {
                            controller.googleSignIn(context);
                          },
                          icon: AppImages.google,
                          label: "Entrar com Google",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
