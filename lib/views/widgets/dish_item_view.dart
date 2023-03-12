import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_menu_app/controller/add_dish_controller.dart';
import 'package:restaurant_menu_app/controller/menu_controller.dart';
import 'package:restaurant_menu_app/models/dish_model.dart';
import 'package:restaurant_menu_app/utils/colors.dart';
import 'package:restaurant_menu_app/utils/constants.dart';
import 'package:restaurant_menu_app/utils/helper_function.dart';
import 'package:restaurant_menu_app/utils/routes/routes_name.dart';
import 'package:restaurant_menu_app/views/widgets/custom_elevated_button.dart';

class DishItemView extends ConsumerWidget {
  final DishModel dish;
  final bool isEditable;
  const DishItemView({
    super.key,
    required this.dish,
    required this.isEditable,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Displaying Dish only when it is Available or is accessed by staff of restaurant
    return dish.isAvailable || isEditable
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    getDishIcon(dish.mealCategory),
                    color: kPrimaryLightColor,
                  ),
                  title: Text(
                    dish.name ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    dish.description ?? '',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  trailing: Text('€ ${dish.price.toString()}'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    kWidthSizedBox,
                    Text('Ready in ${dish.waitingTimeInMinutes} Minutes'),
                    Text(capitalizeString(dish.mealCategory.toString())),
                    Text('Menu: ${capitalizeString(dish.mealType.toString())}'),
                  ],
                ),
                isEditable
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomElevatedButton(
                            title: 'Delete',
                            onPressed: () {
                              ref
                                  .read(menuProvider.notifier)
                                  .removeDishFromMenu(dish);
                            },
                            isEnabled: true,
                          ),
                          CustomElevatedButton(
                            title: 'Edit',
                            onPressed: () {
                              ref
                                  .watch(addDishProvider.notifier)
                                  .setInitValue(dish);
                              Navigator.pushNamed(context, RoutesName.addDish);
                            },
                            isEnabled: true,
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          )
        : Container();
  }
}
