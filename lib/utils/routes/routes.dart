import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/utils/routes/routes_name.dart';
import 'package:restaurant_menu_app/views/screens/add_dish_screen.dart';
import 'package:restaurant_menu_app/views/screens/guest_menu_screen.dart';
import 'package:restaurant_menu_app/views/screens/home_screen.dart';
import 'package:restaurant_menu_app/views/screens/staff_menu_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );

      case RoutesName.guest:
        return MaterialPageRoute(
          builder: (BuildContext context) => const GuestMenuScreen(),
        );

      case RoutesName.staff:
        return MaterialPageRoute(
          builder: (BuildContext context) => const StaffMenuScreen(),
        );

      case RoutesName.addDish:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AddDishScreen(),
        );

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
