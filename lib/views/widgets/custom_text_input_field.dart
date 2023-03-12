import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/utils/style.dart';

class CustomTextInputField extends StatelessWidget {
  final TextEditingController textFieldController;
  final double height;
  final double width;
  final String hintText;
  final FormFieldValidator? validator;
  final FormFieldSetter? onSaved;
  final int maxLines;
  final TextInputType textInputType;

  const CustomTextInputField({
    super.key,
    required this.textFieldController,
    required this.height,
    required this.width,
    required this.hintText,
    this.validator,
    this.onSaved,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        keyboardType: textInputType,
        controller: textFieldController,
        decoration: kCustomFieldInputDecoration.copyWith(
          hintText: hintText,
        ),
        maxLines: maxLines,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
