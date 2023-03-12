import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/utils/colors.dart';

const TextStyle kMenuHeadingTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

const TextStyle kAppBarTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

const TextStyle kHintTextStyleCustomTextInputField = TextStyle(
  color: kGreyColor,
);

final InputDecoration kCustomFieldInputDecoration = InputDecoration(
  hintStyle: kHintTextStyleCustomTextInputField,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.5),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      color: kPrimaryColor,
    ),
  ),
);

final ButtonStyle kElevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: kPrimaryColor, //button color
  foregroundColor: kPrimaryColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);

const TextStyle kElevatedButtonTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: kWhiteColor,
);
