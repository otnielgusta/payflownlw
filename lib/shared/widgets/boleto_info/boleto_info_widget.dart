import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflownlw/shared/themes/app_images.dart';
import 'package:payflownlw/shared/themes/app_text_styles.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';
import 'package:payflownlw/shared/widgets/divider_vertical/divider_vertical_widget.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int size;
  const BoletoInfoWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 40,
          color: AppColors.primary,
        ),
        AnimatedCard(
          direction: AnimatedCardDirection.top,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 80,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AppImages.logomini,
                    color: AppColors.background,
                    width: 56,
                    height: 34,
                  ),
                  Container(
                    height: 32,
                    decoration: BoxDecoration(
                        border: Border(
                            right:
                                BorderSide(width: 1, color: AppColors.stroke))),
                  ),
                  Text.rich(
                    TextSpan(
                        style: TextStyles.captionBackground,
                        text: "Você tem ",
                        children: [
                          TextSpan(
                              style: TextStyles.captionBoldBackground,
                              text: "$size boletos",
                              children: [
                                TextSpan(
                                  style: TextStyles.captionBackground,
                                  text: "\ncadastrados para pagar",
                                ),
                              ]),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
