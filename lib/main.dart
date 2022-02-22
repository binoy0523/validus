import 'package:flutter/material.dart';
import 'package:validus_coin/core/configuration/dev_configuration.dart';
import 'package:validus_coin/core/theme/dev_theme.dart';
import 'package:validus_coin/core/values/assets_manager.dart';
import 'package:validus_coin/core/values/string_manager.dart';
import 'package:validus_coin/validus_coin_app.dart';

import 'package:catcher/core/catcher.dart';
import 'package:catcher/mode/dialog_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';
import 'package:flutter/material.dart';
import 'core/values/environment.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final CatcherOptions options = CatcherOptions(
    DialogReportMode(),
    [],
  );

  /// Catcher displays errors in a popup
  Catcher(
    runAppFunction: () => runApp(
      setupApp(
        configuration: DevConfiguration(),
        stringManager: const StringManager(),
        assetsManager: const AssetsManager(),
        environment: Environment.dev,
        theme: const DevTheme(),
      ),
    ),
    debugConfig: options,
    profileConfig: options,
    releaseConfig: options,
    ensureInitialized: true,
  );
}
