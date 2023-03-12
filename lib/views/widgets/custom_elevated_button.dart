import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/utils/style.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isEnabled;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: kElevatedButtonStyle,
      onPressed: isEnabled ? onPressed : null,
      child: Text(
        title,
        style: kElevatedButtonTextStyle,
      ),
    );
  }
}
