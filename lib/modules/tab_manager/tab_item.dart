import 'package:flutter/material.dart';

/// The pages (in order) which are displayed in the tab manager
enum TabItem {
  /// The first and default page
  watchlist,

  /// A page to view profile
  profile,

}

/// Details of each tab item
class TabItemDetails {
  /// Create a new [TabItemDetails]
  TabItemDetails({
    required this.name,
    required this.icon,
  });

  /// The label of the tab item
  String name;

  /// The icon the use for the tab item
  IconData icon;
}
