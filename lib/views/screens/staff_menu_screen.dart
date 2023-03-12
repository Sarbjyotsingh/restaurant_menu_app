import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_menu_app/controller/menu_controller.dart';
import 'package:restaurant_menu_app/utils/constants.dart';
import 'package:restaurant_menu_app/utils/routes/routes_name.dart';
import 'package:restaurant_menu_app/utils/style.dart';
import 'package:restaurant_menu_app/views/widgets/dish_item_view.dart';

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
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final menuState = ref.watch(menuProvider).dishes;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: menuState.length,
                      itemBuilder: (BuildContext context, int index) {
                        return DishItemView(
                          dish: menuState[index],
                          isEditable: true,
                        );
                      },
                    ),
                  );
                },
              )
            ],
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
