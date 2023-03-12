import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/utils/constants.dart';
import 'package:restaurant_menu_app/utils/routes/routes_name.dart';
import 'package:restaurant_menu_app/utils/style.dart';

class StaffMenuScreen extends StatefulWidget {
  const StaffMenuScreen({Key? key}) : super(key: key);

  @override
  State<StaffMenuScreen> createState() => _StaffMenuScreenState();
}

class _StaffMenuScreenState extends State<StaffMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          kMenuText,
          style: kAppBarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: kScreenPadding,
          child: Column(
            children: const [],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.addDish);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
