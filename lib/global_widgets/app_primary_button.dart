import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// Widget used as the primary button for the app.
class AppPrimaryButton extends StatelessWidget {
  /// Create a Custom button.
  const AppPrimaryButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.height = 56,
  }) : super(key: key);

  /// Title of the button.
  final String title;

  /// The height of the button.
  final double height;

  /// The callback to call when the button is pressed.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Center(
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        constraints: BoxConstraints(minWidth: height),
        child: ElevatedButton(
          onPressed: onPressed,
          child: AutoSizeText(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.button?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
