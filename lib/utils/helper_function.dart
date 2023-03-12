import 'package:flutter/material.dart';

/// Covert List Of Items to List of DropdownMenuItem
List<DropdownMenuItem> getListOfDropDownItemsFromEnum(List list) {
  List<DropdownMenuItem> items = [];
  items = list.map((item) {
    return DropdownMenuItem(
      value: item,
      child: Text(capitalizeString(item.toString())),
    );
  }).toList();
  return items;
}

/// Covert text into Capitalized Text
/// Example: 'helloWorld' to 'Hello World'
String capitalizeString(String text) {
  String tempText = text
      .split('.')
      .last
      .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(0)}');
  return tempText.replaceFirst(tempText[0], tempText[0].toUpperCase());
}
