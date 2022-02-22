import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:validus_coin/core/values/string_manager.dart';
import 'package:validus_coin/global_widgets/app_primary_button.dart';
import 'package:validus_coin/global_widgets/app_text_field.dart';
import 'package:validus_coin/global_widgets/main_app_bar.dart';
import 'package:validus_coin/modules/edit_profile/edit_profile_controller.dart';

/// Edit profile screen.
class EditProfileScreen extends GetView<EditProfileController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final StringManager stringManager = Get.find<StringManager>();
    final borderRadius = 16.0;
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
          ),
          child: MainAppBar(
            title: controller.appBarTitle,
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 18),
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.7,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextField(
                        controller: controller.textFieldController,
                        hintText: controller.fieldName,
                        labelText: controller.fieldName,
                        validator: controller.fieldValidator,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: AppPrimaryButton(
                          title: stringManager.saveButtonTitle,
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              await controller.saveUserDetail();
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close),
            ),
          )),
    );
  }
}
