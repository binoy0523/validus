import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:validus_coin/modules/splash/splash_screen.dart';
import 'package:validus_coin/modules/tab_manager/tab_bar_controller.dart';
import 'package:validus_coin/modules/tab_manager/tab_bar_screen.dart';
import 'package:validus_coin/routing/routes.dart';

/// NavigationRouter class for app navigation.
class NavigationRouter {
  /// Create a router to handle route requests.
  NavigationRouter({
    Logger? logger,
  }) : _logger = logger ?? Get.find<Logger>();

  final Logger _logger;

  /// The global key for keeping track of the context
  final GlobalKey<NavigatorState>? navigatorKey = Catcher.navigatorKey;

  /// Define the initial screen of the app.
  String get initialRoute => tabScreen;

  /// The available routes for the app.
  Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    // Log the route.
    _logger.d('Route: ${routeSettings.name}');

    switch (routeSettings.name) {
      case splashScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            return SplashScreen();
          },
        );


      case tabScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
     
            return GetBuilder<TabBarController>(
              init: TabBarController(),
              builder: (_) => TabBarScreen(),
            );
          },
        );

    }

    _logger.e('Route: ${routeSettings.name}, does not exist');
    return null;
  }
}
