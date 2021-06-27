import 'package:flutter/material.dart';
import 'package:payflownlw/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool enablePrimary;
  final TextStyle? style;
  const LabelButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      required this.enablePrimary,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: enablePrimary ? style : TextStyles.buttonHeading,
      ),
    );
  }
}
