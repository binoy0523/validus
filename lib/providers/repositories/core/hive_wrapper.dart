import 'package:hive/hive.dart';

/// Wrapper around the Global Hive object
class HiveWrapper {
  /// Const constructor
  const HiveWrapper();

  /// Initialize Hive by giving it a home directory.
  ///
  /// (Not necessary in the browser)
  void init(String path) {
    Hive.init(path);
  }

  /// Register a [TypeAdapter] to announce it to Hive.
  void registerAdapter<T>(TypeAdapter<T> adapter) {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter(adapter);
    }
  }

  /// Opens a box.
  ///
  /// If the box is already open, the instance is returned and all provided
  /// parameters are being ignored.
  Future<Box<E>> openBox<E>(String name, {List<int>? encryptionKey}) {
    if (encryptionKey != null) {
      return Hive.openBox(name, encryptionCipher: HiveAesCipher(encryptionKey));
    } else {
      return Hive.openBox(name);
    }
  }

  /// Opens a lazy box.
  ///
  /// If the box is already open, the instance is returned and all provided
  /// parameters are being ignored.
  Future<LazyBox<E>> openLazyBox<E>(String name, List<int> encryptionKey) {
    return Hive.openLazyBox(name, encryptionCipher: HiveAesCipher(encryptionKey));
  }

  /// Returns a previously opened box.
  Box<E> box<E>(String name) {
    return Hive.box(name);
  }

  /// Returns a previously opened lazy box.
  LazyBox<E> lazyBox<E>(String name) {
    return Hive.lazyBox(name);
  }

  /// Checks if a specific box is currently open.
  bool isBoxOpen(String name) {
    return Hive.isBoxOpen(name);
  }

  /// Closes all open boxes.
  Future<void> close() {
    return Hive.close();
  }

  /// Removes the file which contains the box and closes the box.
  ///
  /// In the browser, the IndexedDB database is being removed.
  Future<void> deleteBoxFromDisk(String nme) {
    return Hive.deleteBoxFromDisk(nme);
  }

  /// Deletes all currently open boxes from disk.
  ///
  /// The home directory will not be deleted.
  Future<void> deleteFromDisk() {
    return Hive.deleteFromDisk();
  }

  /// Generates a secure encryption key using the fortuna random algorithm.
  List<int> generateSecureKey() {
    return Hive.generateSecureKey();
  }
}
