import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../features/event/presentation/pages/settings_page.dart';
import '../features/event/presentation/pages/ticket_page.dart';
import '../features/event/presentation/pages/widgets/event_add_update_pages/event_add_update_page.dart';
import 'theme_app.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    // final GlobalKey<FormState> keyform = GlobalKey<FormState>();

    controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),

      navBarStyle: NavBarStyle
          .neumorphic, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      const TicketPage(),
      const EventAddUpdatePage(isUpdateEvent: false),
      // const CartPage(),
      const SettingsPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: ("Home"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.black,
        // routeAndNavigatorSettings:
        //     RouteAndNavigatorSettings(navigatorKey: tab1navigatorKey),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add_box_outlined),
        activeColorPrimary: primaryColor,
        title: ("Add"),
      ),

      // PersistentBottomNavBarItem(
      //     icon: const Icon(Icons.shopping_cart_outlined),
      //     title: ("Cart"),
      //     activeColorPrimary: primaryColor,
      //     inactiveColorPrimary: Colors.black,
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings_outlined),
        title: ("Settings"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.black,
      ),
    ];
  }
}
