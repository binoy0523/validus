import 'package:flutter/material.dart';

/// Main app bar shared across all main pages
class MainAppBar extends StatelessWidget {
  /// Create a new app bar
  const MainAppBar({
    Key? key,
    this.title = "",
    this.child,
    this.actionIcon,
    this.onActionPressed,
    this.centerTitle = false,
    this.titleTextStyle,
    this.leadingWidget,
  }) : super(key: key);

  /// The title to display at the top of the app bar
  final String title;

  /// The content of the app bar
  final Widget? child;

  /// The app bar's right most button's icon
  final IconData? actionIcon;

  /// The action of the app bar's right most button
  final VoidCallback? onActionPressed;

  /// Check if title should be center or not.
  final bool centerTitle;

  /// Style of the title text
  final TextStyle? titleTextStyle;

  /// Leading widget on the AppBar
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        foregroundColor: theme.colorScheme.onBackground,
        backgroundColor: theme.backgroundColor,
        title: Text(title),
        centerTitle: centerTitle,
        titleTextStyle: titleTextStyle ??
            theme.textTheme.headlineLarge?.copyWith(color: theme.colorScheme.onBackground, fontWeight: FontWeight.bold),
        elevation: 1,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            key: const Key("AppBarAction"),
            onPressed: onActionPressed,
            icon: Icon(actionIcon),
          )
        ],
        leading: leadingWidget,
      ),
      body: Container(
        color: theme.backgroundColor,
        child: child,
      ),
    );
  }
}
