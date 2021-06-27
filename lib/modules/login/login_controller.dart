import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflownlw/shared/auth/auth_controller.dart';
import 'package:payflownlw/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();

  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      print("Esse é o usuario: " + response.toString());

      final user =
          UserModel(name: response!.displayName!, photoUrl: response.photoUrl!);

      authController.setUser(user, context);
    } catch (error) {
      authController.setUser(null, context);

      print(error);
    }
  }
}
