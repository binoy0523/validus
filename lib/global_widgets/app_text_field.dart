import 'package:flutter/material.dart';

/// TextField used in the app.
class AppTextField extends StatelessWidget {
  /// Create new instance of [AppTextField]
  const AppTextField({
    Key? key,
    this.controller,
    this.validator,
    this.initialText,
    this.hintText,
    this.labelText,
  }) : super(key: key);

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// TextField validator.
  final String? Function(String?)? validator;

  /// Initial text inside textField.
  final String? initialText;

  /// Hint text inside textField.
  final String? hintText;

  /// Labe text above textField which denotes the type of field.
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      // color: theme.colorScheme.secondaryContainer,
      // height: 56,

      child: TextFormField(
        autofocus: true,
        controller: controller,
        validator: validator,
        initialValue: initialText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          
          fillColor: theme.colorScheme.secondaryContainer,
          filled: true,
          labelStyle: theme.textTheme.subtitle1?.copyWith(color: theme.disabledColor),
          alignLabelWithHint: true,
          hintText: hintText,
          hintStyle: theme.textTheme.subtitle1?.copyWith(color: theme.disabledColor),
          labelText: labelText,
          contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}
