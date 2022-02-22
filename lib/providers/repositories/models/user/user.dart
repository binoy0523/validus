import 'package:hive/hive.dart';

part 'user.g.dart';

/// The User detail model.
@HiveType(typeId: 1)
class User extends HiveObject {
  /// Constructor
  User({
     this.name,
     this.email,
    this.address,
  });

  /// name of user.
  @HiveField(1)
  String? name;

  /// email of user.
  @HiveField(2)
  String? email;

  /// address of user.
  @HiveField(3)
  String? address;
}
