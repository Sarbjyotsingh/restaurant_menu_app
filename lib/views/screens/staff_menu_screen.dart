import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/utils/constants.dart';

class StaffMenuScreen extends StatefulWidget {
  const StaffMenuScreen({Key? key}) : super(key: key);

  @override
  State<StaffMenuScreen> createState() => _StaffMenuScreenState();
}

class _StaffMenuScreenState extends State<StaffMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kScreenPadding,
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
