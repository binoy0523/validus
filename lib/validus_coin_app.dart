import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validus_coin/core/configuration/configuration.dart';
import 'package:validus_coin/core/theme/base/main_theme.dart';
import 'package:validus_coin/core/utils/injection.dart';
import 'package:validus_coin/core/values/assets_manager.dart';
import 'package:validus_coin/core/values/environment.dart';
import 'package:validus_coin/core/values/string_manager.dart';
import 'package:validus_coin/modules/tab_manager/tab_bar_screen.dart';
import 'package:validus_coin/routing/router.dart';

/// Root of the App.
Widget setupApp(
    {required Configuration configuration,
    required StringManager stringManager,
    required AssetsManager assetsManager,
    required Environment environment,
    required MainTheme theme}) {
  setupInjection(
    configuration: configuration,
    stringManager: stringManager,
    assetsManager: assetsManager,
    environment: environment,
    mainTheme: theme,
  );

  return ValidusCoinApp();
}

class ValidusCoinApp extends StatefulWidget {
  /// Constructor with dependencies
  ValidusCoinApp({
    NavigationRouter? router,
    StringManager? stringManager,
    MainTheme? theme,
  })  : _router = router ?? Get.find<NavigationRouter>(),
        _stringManager = stringManager ?? Get.find<StringManager>(),
        _theme = theme ?? Get.find<MainTheme>();
  final NavigationRouter _router;
  final StringManager _stringManager;
  final MainTheme _theme;

  @override
  State<StatefulWidget> createState() => _ValidusCoinAppState();
}

class _ValidusCoinAppState extends State<ValidusCoinApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: widget._router.navigatorKey,
      builder: (BuildContext context, Widget? child) {
        child ??= TabBarScreen();
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0, boldText: false),
          child: Material(
            child: child,
          ),
        );
      },
      title: widget._stringManager.appTitle,
      onGenerateRoute: widget._router.generateRoute,
      initialRoute: widget._router.initialRoute,
      theme: widget._theme.lightTheme,
      darkTheme: widget._theme.darkTheme,
    );
  }
}
