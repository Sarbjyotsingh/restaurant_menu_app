import 'package:flutter/material.dart';

class CustomSwitchListTile extends StatelessWidget {
  final String text;
  final bool value;
  final ValueChanged onChanged;
  const CustomSwitchListTile({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(text),
      value: value,
      onChanged: onChanged,
    );
  }
}
