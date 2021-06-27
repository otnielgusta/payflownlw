import 'package:flutter/material.dart';
import 'package:payflownlw/shared/themes/app_text_styles.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';
import 'package:payflownlw/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subTitle;
  const BottomSheetWidget(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.black.withOpacity(0.6),
                )),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Text.rich(
                          TextSpan(
                              style: TextStyles.buttonBoldHeading,
                              text: title,
                              children: [
                                TextSpan(
                                    style: TextStyles.buttonHeading,
                                    text: "\n$subTitle"),
                              ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      width: 1, color: AppColors.stroke))),
                          child: SetLabelButtons(
                              enableSecondary: false,
                              enablePrimary: true,
                              primaryLabel: primaryLabel,
                              primaryOnPressed: primaryOnPressed,
                              secondaryLabel: secondaryLabel,
                              secondaryOnPressed: secondaryOnPressed),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
