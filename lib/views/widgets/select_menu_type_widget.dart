import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_menu_app/utils/constants.dart';
import 'package:restaurant_menu_app/utils/style.dart';

class SelectMenuTypeWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;
  const SelectMenuTypeWidget({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              size: 80,
              color: iconColor,
            ),
            kWidthSizedBox,
            Text(
              text,
              style: kMenuHeadingTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
