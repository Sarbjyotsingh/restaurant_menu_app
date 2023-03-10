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
  Future<void> addDishToMenu(DishModel dish) async {
    // Perform your API call to add dish to API
    DishModel dishItem = await MenuAPIResponse.addOrUpdateDishToMenu(dish);

    // Update the state of the provider
    state = state.copyWith(dishes: [...state.dishes, dishItem]);
  }

  /// updates a dish in the menu and updates the state of the provider.
  Future<void> updateDishToMenu(DishModel dish) async {
    //  Accessing index of dish in List
    int index = state.dishes.indexWhere((item) => item.id == dish.id);

    // Perform your API call to update dish to API
    DishModel dishItem = await MenuAPIResponse.addOrUpdateDishToMenu(dish);

    //Changing Current data to updated data
    state.dishes[index] = dishItem;

    // Update the state of the provider
    state = state.copyWith(dishes: [...state.dishes]);
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
