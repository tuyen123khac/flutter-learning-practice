import 'package:flutter/material.dart';
import 'package:flutter_learning_practice/navigations/route_names.dart';
import 'package:flutter_learning_practice/screens/listview_under_the_hood_screen.dart';
import 'package:flutter_learning_practice/screens/listview_update_screen.dart';
import 'package:flutter_learning_practice/screens/main_screen.dart';
import 'package:flutter_learning_practice/screens/element_tree_screen.dart';
import 'package:flutter_learning_practice/screens/swap_stateless_screen.dart';

class NavigationManager {
  static Route<dynamic> getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.secondScreen:
        return MaterialPageRoute(
          builder: (_) => const ElementTreeScreen(),
          settings: routeSettings,
        );
      case RouteNames.thirdScreen:
        return MaterialPageRoute(
          builder: (_) => const SwapStatelessScreen(),
          settings: routeSettings,
        );
      case RouteNames.forthScreen:
        return MaterialPageRoute(
          builder: (_) => const SwapStatelessScreen(),
          settings: routeSettings,
        );
      case RouteNames.fifthScreen:
        return MaterialPageRoute(
          builder: (_) => const ListviewUnderTheHoodScreen(),
          settings: routeSettings,
        );
      case RouteNames.sixthScreen:
        return MaterialPageRoute(
          builder: (_) => const ListViewUpdateScreen(),
          settings: routeSettings,
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const MainScreen(), settings: routeSettings);
    }
  }
}
