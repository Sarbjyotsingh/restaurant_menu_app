import 'package:restaurant_menu_app/models/dish_model.dart';

class MenuModel {
  List<DishModel> dishes;

  MenuModel({
    required this.dishes,
  });

  MenuModel copyWith({List<DishModel>? dishes}) {
    return MenuModel(dishes: dishes ?? this.dishes);
  }
}
