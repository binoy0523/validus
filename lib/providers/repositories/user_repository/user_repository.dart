import 'package:get/instance_manager.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';
import 'package:validus_coin/providers/repositories/core/database.dart';
import 'package:validus_coin/providers/repositories/models/user/user.dart';

/// Class that responsible to serve and save ser details..
class UserRepository {
  /// Create new instance of [UserRepository]
  UserRepository({Database? database, Logger? logger})
      : _database = database ?? Get.find<Database>(),
        _logger = logger ?? Get.find<Logger>();

  final Database _database;
  final Logger _logger;
  final _userDetailsKey = 'user_details';

  final BehaviorSubject<User> userStream = BehaviorSubject();

  /// Fetch user from local
  Future<User?> fetchUser() async {
    final userBox = await _database.getUserBox();
    _logger.v('Fetch user from local database');
    final cachedUser = userBox.get(_userDetailsKey);
    return Future.value(cachedUser);
  }

  /// Add user to local
  Future<void> putLocalUser(User user) async {
    final userBox = await _database.getUserBox();
    await userBox.clear();
    try {
      _logger.v('add user to local database');
      await userBox.put(_userDetailsKey, user);
      userStream.add(user);
    } catch (e) {
      _logger.v('Unable to add user in local database');
      _logger.log(Level.error, e.toString());
    }
  }
}
