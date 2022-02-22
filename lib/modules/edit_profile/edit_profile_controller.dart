import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:validus_coin/core/values/string_manager.dart';
import 'package:validus_coin/modules/profile/profile_field_type.dart';
import 'package:validus_coin/modules/shared/base_controller.dart';
import 'package:validus_coin/providers/repositories/models/user/user.dart';
import 'package:validus_coin/providers/repositories/user_repository/user_repository.dart';

/// Controller for the profile editing screen.
class EditProfileController extends BaseController {
  ///
  EditProfileController({
    required this.fieldType,
    this.user,
    StringManager? stringManager,
    UserRepository? userRepository,
  })  : _stringManager = stringManager ?? Get.find<StringManager>(),
        _userRepository = userRepository ?? Get.find<UserRepository>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    _initialize();
    super.onReady();
  }

  void _initialize() {
    if (user != null) {
      switch (fieldType) {
        case ProfileFieldType.name:
          textFieldController.text = user?.name ?? "";
          break;
        case ProfileFieldType.email:
          textFieldController.text = user?.email ?? "";
          break;
        case ProfileFieldType.address:
          textFieldController.text = user?.address ?? "";
          break;
      }
    }
  }

  /// Type of editing field in [ProfileFieldType].
  final ProfileFieldType fieldType;

  /// User model to be edited.
  User? user;

  final StringManager _stringManager;
  final UserRepository _userRepository;

  /// controller to manage the text field in the form
  final textFieldController = TextEditingController();

  /// Name of the editing field.
  String get fieldName => fieldType.fieldName;

  /// The title to be shown.
  String get appBarTitle => _stringManager.editProfileScreeTitle(fieldName);

  FieldValidator get fieldValidator {
    switch (fieldType) {
      case ProfileFieldType.email:
        return MultiValidator([
          RequiredValidator(
            errorText: _stringManager.emailRequiredErrorText,
          ),
          EmailValidator(
            errorText: _stringManager.emailValidationText,
          ),
        ]);
      case ProfileFieldType.address:
        return RequiredValidator(
          errorText: _stringManager.emailRequiredErrorText,
        );

      case ProfileFieldType.name:
        return RequiredValidator(
          errorText: _stringManager.nameRequiredErrorText,
        );
    }
  }

  /// Save the edited user detail to local.
  Future saveUserDetail() async {
    final value = textFieldController.text;
    if (user == null) {
      user = User();
    }
    switch (fieldType) {
      case ProfileFieldType.name:
        user!.name = value;
        break;
      case ProfileFieldType.email:
        user!.email = value;
        break;
      case ProfileFieldType.address:
        user!.address = value;
        break;
    }
    return _userRepository.putLocalUser(user!);
  }
}
