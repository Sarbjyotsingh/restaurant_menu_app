import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_menu_app/utils/colors.dart';
import 'package:restaurant_menu_app/utils/constants.dart';
import 'package:restaurant_menu_app/utils/style.dart';

class MenuHeadlineWidget extends StatelessWidget {
  const MenuHeadlineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        FaIcon(
          kMenuIcon,
          size: 35,
          color: kPrimaryLightColor,
        ),
        kWidthSizedBox,
        Text(
          kMenuText,
          style: kMenuHeadingTextStyle,
        ),
      ],
    );
  }
}
