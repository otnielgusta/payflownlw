import 'package:flutter/material.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';

class DividerVerticalWidget extends StatelessWidget {
  const DividerVerticalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color: AppColors.stroke),
        ),
      ),
    );
  }
}
