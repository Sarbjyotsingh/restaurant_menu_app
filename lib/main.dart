import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_menu_app/utils/colors.dart';
import 'package:restaurant_menu_app/utils/routes/routes.dart';
import 'package:restaurant_menu_app/utils/routes/routes_name.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: kPrimaryColor),
        primaryColor: kPrimaryLightColor,
        scaffoldBackgroundColor: kWhiteColor,
        appBarTheme: const AppBarTheme(
          color: kPrimaryLightColor,
          elevation: 0,
        ),
      ),
      initialRoute: RoutesName.home,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
