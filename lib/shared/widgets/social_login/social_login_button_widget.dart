import 'package:flutter/material.dart';
import 'package:payflownlw/shared/themes/app_text_styles.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';

class SocialLoginButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String label;
  const SocialLoginButtonWidget(
      {Key? key, required this.onTap, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.shape,
          border: Border.all(color: AppColors.stroke),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1, color: AppColors.stroke)),
              ),
              child: Image.asset(icon),
            ),
            Expanded(
                child: Center(
                    child: Text(
              label,
              style: TextStyles.buttonGray,
            )))
          ],
        ),
      ),
    );
  }
}
