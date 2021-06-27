import 'package:flutter/material.dart';
import 'package:payflownlw/shared/models/user_model.dart';
import 'package:payflownlw/shared/themes/app_text_styles.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';

class AppBarWidget extends StatelessWidget {
  final String nome;
  final String image;
  const AppBarWidget({
    Key? key,
    required this.nome,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      color: AppColors.primary,
      child: SafeArea(
        child: Center(
          child: ListTile(
            title: Text.rich(
              TextSpan(
                  style: TextStyles.titleRegular,
                  text: "Olá, ",
                  children: [
                    TextSpan(
                      style: TextStyles.titleBoldBackground,
                      text: this.nome,
                    ),
                  ]),
            ),
            subtitle: Text("Mantenha suas contas em dia",
                style: TextStyles.captionShape),
            trailing: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: NetworkImage(this.image))),
            ),
          ),
        ),
      ),
    );
  }
}
