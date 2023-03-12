import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/utils/style.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final value;
  final List<DropdownMenuItem> items;
  final String hintText;
  final ValueChanged onChanged;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;

  const CustomDropdownButtonFormField({
    super.key,
    required this.value,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      key: key,
      value: value,
      hint: Text(hintText),
      decoration: kCustomFieldInputDecoration,
      onChanged: onChanged,
      items: items,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
