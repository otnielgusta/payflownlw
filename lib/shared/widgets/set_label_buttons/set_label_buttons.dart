import 'package:flutter/material.dart';
import 'package:payflownlw/shared/themes/app_text_styles.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';
import 'package:payflownlw/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:payflownlw/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimary;
  final bool enableSecondary;
  final TextStyle? style;

  const SetLabelButtons(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed,
      required this.enablePrimary,
      this.style,
      required this.enableSecondary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.maxFinite,
              child: LabelButton(
                enablePrimary: enablePrimary,
                style: TextStyles.buttonPrimary,
                label: primaryLabel,
                onPressed: primaryOnPressed,
              ),
            ),
          ),
          DividerVerticalWidget(),
          Expanded(
            child: Container(
              height: double.maxFinite,
              child: LabelButton(
                enablePrimary: enableSecondary,
                label: secondaryLabel,
                onPressed: secondaryOnPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
