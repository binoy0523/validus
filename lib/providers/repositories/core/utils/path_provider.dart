import 'dart:io';

import 'package:path_provider/path_provider.dart' as path_provider;

/// Provides commonly used locations on the filesystem. Supports iOS and Android.
/// Wrapper for path_provider plugin
class DirectoryPaths {
  
  /// Path to a directory where the application may place application support
  /// files.
  Future<Directory> getApplicationSupportDirectory() async {
    return path_provider.getApplicationSupportDirectory();
  }
}
