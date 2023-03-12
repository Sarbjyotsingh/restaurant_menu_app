import 'package:restaurant_menu_app/data/networking/network_api_service.dart';
import 'package:restaurant_menu_app/models/dish_model.dart';
import 'package:restaurant_menu_app/models/menu_api_response_model.dart';

// Run node.js server locally
const String apiEndPoint = 'http://localhost:9000';

/// MenuAPIResponse uses the NetworkApiService class to communicate with the backend server and update the menu.
class MenuAPIResponse {
  static dynamic _apiResponse;

  /// This method fetches all the dishes from the menu
  static Future<List<DishModel>> getMenuDishes() async {
    String url = '$apiEndPoint/dishes';
    _apiResponse = await NetworkApiService.getGetApiResponse(url);
    MenuAPIResponseModel responseObject =
        MenuAPIResponseModel.fromJson(_apiResponse);

    // Convert the list of dynamic objects to a list of DishModel objects
    List<DishModel> dishes = [];
    for (var data in responseObject.data) {
      var dish = DishModel.fromJson(data);
      dishes.add(dish);
    }
    return dishes;
  }

  /// This method fetches a specific dish from the menu using its id
  static Future<DishModel> getMenuDishById(String id) async {
    String url = '$apiEndPoint/dishes/$id';
    _apiResponse = await NetworkApiService.getGetApiResponse(url);
    MenuAPIResponseModel responseObject =
        MenuAPIResponseModel.fromJson(_apiResponse);
    DishModel dish = DishModel.fromJson(responseObject.data);
    return dish;
  }

  /// This method adds a new or update an existing dish to the menu
  static Future<DishModel> addOrUpdateDishToMenu(DishModel dish) async {
    String url = '$apiEndPoint/dishes';
    DishModel dishItem = await NetworkApiService.getPutApiResponse(
      url,
      dish.toJson(),
    );
    return dishItem;
  }

  /// This method deletes all the dishes from the menu
  static Future deleteAllDishFromMenu() async {
    String url = '$apiEndPoint/dishes/clear';
    await NetworkApiService.getGetApiResponse(url);
  }

  /// This method deletes a specific dish from the menu using its id
  static Future deleteDishById(String? id) async {
    String url = '$apiEndPoint/dishes/$id';
    await NetworkApiService.getDeleteApiResponse(url);
  }
}
