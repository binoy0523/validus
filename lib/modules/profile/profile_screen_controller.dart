import 'package:get/get.dart' as getx;
import 'package:rxdart/rxdart.dart';
import 'package:validus_coin/modules/shared/base_controller.dart';
import 'package:validus_coin/providers/repositories/models/user/user.dart';
import 'package:validus_coin/providers/repositories/user_repository/user_repository.dart';

/// Controller for Profile screen,
class ProfileScreenController extends BaseController {
  /// Create new instance of [ProfileScreenController]
  ProfileScreenController({
    UserRepository? userRepository,
  }) : _userRepository = userRepository ?? getx.Get.find<UserRepository>();

  final UserRepository _userRepository;
  CompositeSubscription _disposables = CompositeSubscription();

  /// Observable user object
  getx.Rx<User> user = User().obs;

  @override
  void onInit() {
    super.onInit();
    // Listen to user model update
    _disposables.add(_userRepository.userStream.listen((value) {
      user(value);
      update();
    }));
    getUser();
  }

  @override
  void onClose() {
    _disposables.clear();
    super.onClose();
  }

  /// Fetch cached user object
  void getUser() async {
    final cachedUser = await _userRepository.fetchUser();
    user(cachedUser);
  }
}
