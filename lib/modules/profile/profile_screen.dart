import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:validus_coin/global_widgets/app_primary_button.dart';
import 'package:validus_coin/global_widgets/app_text_field.dart';
import 'package:validus_coin/global_widgets/main_app_bar.dart';
import 'package:validus_coin/global_widgets/profile_field.dart';
import 'package:validus_coin/modules/edit_profile/edit_profile_controller.dart';
import 'package:validus_coin/modules/edit_profile/edit_profile_screen.dart';
import 'package:validus_coin/modules/profile/profile_field_type.dart';
import 'package:validus_coin/modules/profile/profile_screen_controller.dart';

/// Profile screen of user.
class ProfileScreen extends GetView<ProfileScreenController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MainAppBar(
      title: "Profile",
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.all(16),
          color: theme.colorScheme.surface,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                return ProfileField(
                  fieldValue: controller.user.value.name,
                  fieldType: ProfileFieldType.name,
                  onEdit: (type) {
                    onEditActionWithType(type, context);
                  },
                );
              }),
              Obx(() {
                return ProfileField(
                  fieldValue: controller.user.value.email,
                  fieldType: ProfileFieldType.email,
                  onEdit: (type) {
                    onEditActionWithType(type, context);
                  },
                );
              }),
              Obx(() {
                return ProfileField(
                  fieldValue: controller.user.value.address,
                  fieldType: ProfileFieldType.address,
                  onEdit: (type) {
                    onEditActionWithType(type, context);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void onEditActionWithType(ProfileFieldType type, BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.black,
      context: context,
      builder: (context) => GetBuilder<EditProfileController>(
        init: EditProfileController(fieldType: type, user: controller.user.value),
        builder: (_) => EditProfileScreen(),
      ),
    );
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     fullscreenDialog: true,
    //     builder: (context) => GetBuilder<EditProfileController>(
    //       init: EditProfileController(fieldType: type, user: controller.user.value),
    //       builder: (_) => EditProfileScreen(),
    //     ),
    //   ),
    // );
  }
}
