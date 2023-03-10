import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_menu_app/utils/colors.dart';
import 'package:restaurant_menu_app/utils/constants.dart';
import 'package:restaurant_menu_app/views/widgets/menu_headline_widget.dart';
import 'package:restaurant_menu_app/views/widgets/select_menu_type_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: MenuHeadlineWidget(),
            ),
            Expanded(
              flex: 5,
              child: SelectMenuTypeWidget(
                text: kGuestText,
                backgroundColor: kPurpleColor,
                icon: kGuestIcon,
                iconColor: kYellowColor,
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 5,
              child: SelectMenuTypeWidget(
                text: kStaffText,
                backgroundColor: kGreenColor,
                icon: kStaffIcon,
                iconColor: kBlackColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
