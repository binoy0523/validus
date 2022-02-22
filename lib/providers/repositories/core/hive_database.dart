import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:validus_coin/core/utils/secure_storage/secure_storage.dart';
import 'package:validus_coin/providers/repositories/core/database.dart';
import 'package:validus_coin/providers/repositories/core/hive_wrapper.dart';
import 'package:validus_coin/providers/repositories/core/utils/path_provider.dart';
import 'package:validus_coin/providers/repositories/models/user/user.dart';

/// Hive based database to store data
/// Make sure initializeDatabase called before using hive database
class HiveDatabase extends Database {
  /// Member wise constructor to initialize Hive Database with it's dependencies
  HiveDatabase({DirectoryPaths? paths, SecureStorage? secureStorage, HiveWrapper? hive})
      : _directoryPaths = paths ?? Get.find<DirectoryPaths>(),
        _secureStorage = secureStorage ?? Get.find<SecureStorage>(),
        _hive = hive ?? Get.find<HiveWrapper>();

  final SecureStorage _secureStorage;
  final HiveWrapper _hive;
  final DirectoryPaths _directoryPaths;
  bool _initialized = false;

  static const String _userBoxName = "USER_BOX";

  @override
  Future<void> initializeDatabase() async {
    if (!_initialized) {
      final directory = await _directoryPaths.getApplicationSupportDirectory();
      _hive.init(directory.path);
      _registerAdapters();
      _initialized = true;
    }
  }

  @override
  Future<void> clearDatabase() async {
    await initializeDatabase();
    await _secureStorage.clearEncryptionKey();
    await _hive.deleteFromDisk();
  }

  @override
  Future<void> closeDatabase() async {
    await initializeDatabase();
    await _hive.close();
  }

  @override
  Future<Box<User>> getUserBox() async {
    await initializeDatabase();
    final key = await _getEncryptionKey();
    return _hive.openBox(_userBoxName, encryptionKey: key);
  }

  // Private Methods

  /// Adds hive type adapters
  void _registerAdapters() {
    if (!_initialized) {
      _hive.registerAdapter<User>(UserAdapter());
    }
  }

  Future<List<int>> _getEncryptionKey() async {
    final currentKey = await _secureStorage.encryptionKey;
    if (currentKey == "") {
      // create a key and save it
      final newKey = String.fromCharCodes(_hive.generateSecureKey());
      await _secureStorage.setEncryptionKey(newKey);
      return newKey.codeUnits;
    } else {
      // return the existing key encoded
      return currentKey.codeUnits;
    }
  }
}
