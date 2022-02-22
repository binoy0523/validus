import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:validus_coin/core/configuration/configuration.dart';
import 'package:validus_coin/core/theme/base/main_theme.dart';
import 'package:validus_coin/core/utils/secure_storage/app_secure_storage.dart';
import 'package:validus_coin/core/utils/secure_storage/secure_storage.dart';
import 'package:validus_coin/core/values/assets_manager.dart';
import 'package:validus_coin/core/values/environment.dart';
import 'package:validus_coin/core/values/string_manager.dart';
import 'package:validus_coin/providers/api/stocks/stocks_api.dart';
import 'package:validus_coin/providers/repositories/core/database.dart';
import 'package:validus_coin/providers/repositories/core/hive_database.dart';
import 'package:validus_coin/providers/repositories/core/hive_wrapper.dart';
import 'package:validus_coin/providers/repositories/core/utils/path_provider.dart';
import 'package:validus_coin/providers/repositories/user_repository/user_repository.dart';
import 'package:validus_coin/routing/router.dart';

/// Sets up Dependency Injection (DI).
/// Injects the provided classes along with the other classes/services/repositories necessary to run the application.
void setupInjection({
  required Configuration configuration,
  required StringManager stringManager,
  required AssetsManager assetsManager,
  required Environment environment,
  required MainTheme mainTheme,
  Logger? logger,
}) {
  Get
    ..put(configuration, permanent: true)
    ..put(stringManager, permanent: true)
    ..put(assetsManager, permanent: true)
    ..put(environment, permanent: true)
    ..put(mainTheme, permanent: true)
    ..put(_dio, permanent: true)
    ..put(logger ?? _logger, permanent: true)
    ..put(_router, permanent: true)
    ..lazyPut(() => _accountsApi)
    ..lazyPut(() => _hiveWrapper)
    ..lazyPut(() => _database)
    ..lazyPut(() => _secureStorage)
    ..lazyPut(() => _directoryPaths)
    ..lazyPut(() => _userRepository);
}

///Utilities
Logger get _logger => Logger();

NavigationRouter get _router => NavigationRouter();

Dio get _dio => setupDioRestClient(configuration: Get.find<Configuration>());

/// Setup Dio
Dio setupDioRestClient({
  required Configuration configuration,
}) {
  final options = BaseOptions(
    baseUrl: configuration.baseUrl,
    connectTimeout: configuration.restClientConnectTimeout,
    receiveTimeout: configuration.restClientReceiveTimeout,
  );
  final dio = Dio(options);
  return dio;
}

StocksApi get _accountsApi => StocksApi(Get.find<Dio>());

// Repository
HiveWrapper get _hiveWrapper => const HiveWrapper();
Database get _database => HiveDatabase();
SecureStorage get _secureStorage => AppSecureStorage(const FlutterSecureStorage());
UserRepository get _userRepository => UserRepository();
DirectoryPaths get _directoryPaths => DirectoryPaths();
