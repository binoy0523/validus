import 'package:flutter/material.dart';

/// The pages (in order) which are displayed in the tab manager
enum TabItem {
  /// The first and default page
  stocks,

  /// A page to view profile
  profile,
}

/// Details of each tab item
class TabItemDetails {


  /// Create a new [TabItemDetails]
  TabItemDetails({
    required this.name,
    required this.defaultIconPath,
    required this.activeIconPath,
  });

  /// The label of the tab item
  String name;

  /// The path of the icon for the tab item
  String defaultIconPath;

  String activeIconPath;
}
