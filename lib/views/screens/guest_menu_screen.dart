import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/utils/constants.dart';

class GuestMenuScreen extends StatefulWidget {
  const GuestMenuScreen({Key? key}) : super(key: key);

  @override
  State<GuestMenuScreen> createState() => _GuestMenuScreenState();
}

class _GuestMenuScreenState extends State<GuestMenuScreen> {
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
