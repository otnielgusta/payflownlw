import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflownlw/shared/themes/app_text_styles.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';

class TextFieldInsertDadosWidget extends StatefulWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  const TextFieldInsertDadosWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.validator,
    this.initialValue,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldInsertDadosWidgetState createState() =>
      _TextFieldInsertDadosWidgetState();
}

class _TextFieldInsertDadosWidgetState
    extends State<TextFieldInsertDadosWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: AppColors.stroke))),
        child: Container(
          child: TextFormField(
            onChanged: widget.onChanged,
            controller: widget.controller,
            validator: widget.validator,
            initialValue: widget.initialValue,
            style: TextStyles.input,
            decoration: InputDecoration(
              icon: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1, color: AppColors.stroke),
                  ),
                ),
                child: Icon(
                  widget.icon,
                  color: AppColors.primary,
                ),
              ),
              labelStyle: TextStyles.input,
              labelText: widget.label,
              contentPadding: EdgeInsets.only(left: 16),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
