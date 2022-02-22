import 'package:hive/hive.dart';
import 'package:validus_coin/providers/repositories/models/user/user.dart';

/// Database to store app data
/// Make sure initializeDatabase called before using database
abstract class Database {
  /// Initialize and configure the hive database
  Future<void> initializeDatabase();

  /// Close all database storage connection
  Future<void> closeDatabase();

  /// Clear all data from database
  Future<void> clearDatabase();

  /// Retrieves the user box with all user details
  Future<Box<User>> getUserBox();
}
