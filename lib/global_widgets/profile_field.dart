import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validus_coin/core/values/string_manager.dart';
import 'package:validus_coin/modules/profile/profile_field_type.dart';

/// Widget for each fields in profile.
class ProfileField extends StatelessWidget {
  /// Create new instance of [ProfileField]
  ProfileField({
    Key? key,
    required this.fieldType,
    this.fieldValue,
    required this.onEdit,
  }) : super(key: key);

  final ProfileFieldType fieldType;

  final String? fieldValue;

  /// Edit button action
  final Function(ProfileFieldType) onEdit;

  final _stringManager = Get.find<StringManager>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                fieldType.fieldName,
                style: TextStyle(fontSize: 14),
              ),
              TextButton(
                  onPressed: () {
                    onEdit(fieldType);
                  },
                  child: Text(
                    _stringManager.editButtonTitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.colorScheme.onBackground,
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ],
          ),
          Text(
            fieldValue ?? "",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
