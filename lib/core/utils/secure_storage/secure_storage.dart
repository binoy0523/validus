/// A secure storage interface to store key value pair data on the native device secure storage mechanism.
abstract class SecureStorage {
  /// Get the stored encryption key in secure storage
  Future<String> get encryptionKey;

  /// Set the stored encryption key in secure storage to the [newValue]
  Future<void> setEncryptionKey(String newValue);

  /// Deletes the stored encryption key from secure storage
  Future<void> clearEncryptionKey();

  /// Deletes all secure storage key value pairs
  Future<void> clearAll();
}
