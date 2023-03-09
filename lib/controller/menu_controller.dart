import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_menu_app/data/response/menu_api_response.dart';
import 'package:restaurant_menu_app/models/dish_model.dart';
import 'package:restaurant_menu_app/models/menu_model.dart';

/// Provider that manages the state of the menu.
final menuProvider = StateNotifierProvider<MenuControllerNotifier, MenuModel>(
  (ref) => MenuControllerNotifier(),
);

class MenuControllerNotifier extends StateNotifier<MenuModel> {
  MenuControllerNotifier() : super(MenuModel(dishes: [])) {
    // Get all the menu dishes on initialization of the provider
    getAllDishesForMenu();
  }


  /// Fetches all dishes for the menu and updates the state of the provider.
  Future<void> getAllDishesForMenu() async {
    // Perform your API call to fetch all dishes here
    List<DishModel> dishes = await MenuAPIResponse.getMenuDishes();

    // Update the state of the provider
    state = state.copyWith(dishes: dishes);
  }

  /// Adds or updates a dish in the menu and updates the state of the provider.
  Future<void> addOrUpdateDishToMenu(DishModel dish) async {
    // Perform your API call to add/update dish to API
    await MenuAPIResponse.addOrUpdateDishToMenu(dish);

    // Update the state of the provider
    state = state.copyWith(dishes: [...state.dishes, dish]);
  }

  /// Removes a dish from the menu and updates the state of the provider.
  Future<void> removeDishFromMenu(DishModel dish) async {
    // Perform your API call to remove dish to API
    await MenuAPIResponse.deleteDishById(dish.id);

    // Update the state of the provider
    state.dishes.remove(dish);
    state = state.copyWith(dishes: state.dishes);
  }

  /// Resets the menu by removing all dishes and updating the state of the provider.
  Future<void> resetMenu() async {
    // Perform your API call to removing all dishes to API
    await MenuAPIResponse.deleteAllDishFromMenu();

    // Update the state of the provider
    state = MenuModel(dishes: []);
  }
}


