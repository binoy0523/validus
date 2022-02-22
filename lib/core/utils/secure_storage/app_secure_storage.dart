import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:validus_coin/core/utils/secure_storage/secure_storage.dart';

/// A secure storage interface to store key value pair data on the native device secure storage mechanism.
class AppSecureStorage extends SecureStorage {
  /// Constructor that initializes the class using the given FlutterSecureStorage [_flutterSecureStorage]
  ///
  /// [_flutterSecureStorage] should NOT be null
  AppSecureStorage(this._flutterSecureStorage);
  final FlutterSecureStorage _flutterSecureStorage;

  final String _encryptionKeyKey = "KEY_ENCRYPTION_KEY";

  final Map<String, String> _cache = <String, String>{};

  @override
  Future<String> get encryptionKey => _getValue(_encryptionKeyKey);

  @override
  Future<void> setEncryptionKey(String newValue) => _setValue(_encryptionKeyKey, newValue);

  @override
  Future<void> clearEncryptionKey() => _clearValue(_encryptionKeyKey);

  @override
  Future<void> clearAll() {
    _cache.clear();
    return _flutterSecureStorage.deleteAll();
  }

  // Private methods

  Future<String> _getValue(String key) async {
    if (_cache.containsKey(key)) {
      return _cache[key] ?? "";
    }
    // Else it is not in the cache
    String? value = await _flutterSecureStorage.read(key: key).catchError(
          (error, stackTrace) => null,
        );
    value = value ?? "";
    _cache[key] = value;
    return value;
  }

  Future<void> _setValue(String key, String value) {
    // Set the cache
    _cache[key] = value;
    return _flutterSecureStorage.write(key: key, value: value).catchError(
          (error) => _cache.remove(key),
        );
  }

  Future<void> _clearValue(String key) {
    // Remove the value and then clear the cache after to avoid race conditions
    return _flutterSecureStorage
        .delete(key: key)
        .catchError((_) => _cache.remove(key))
        .then((value) => _cache.remove(key));
  }
}
