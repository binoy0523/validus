import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validus_coin/core/theme/base/main_theme.dart';
import 'package:validus_coin/modules/tab_manager/tab_item.dart';


/// The bar with navigation options displayed on the bottom of the tab manager page
class AppBottomNavigationBar extends StatelessWidget {
  /// Create a new bottom navigation bar
  const AppBottomNavigationBar({
    required this.currentTab,
    required this.items,
    required this.onSelectTab,
  });

  /// The current selected tab
  final TabItem currentTab;

  /// All the possible items which can be selected
  final Map<TabItem, TabItemDetails> items;

  /// Fired when the user selects a different tab
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
      color: theme.backgroundColor,
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Material(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color:theme.backgroundColor,
            child: BottomNavigationBar(
              items: items.values.map(_buildItem).toList(),
              onTap: (index) => onSelectTab(items.keys.toList()[index]),
              currentIndex: currentTab.index,
              selectedItemColor: theme.colorScheme.secondary,
              // showSelectedLabels: true,
              // showUnselectedLabels: true,
              selectedFontSize: 12,
              unselectedItemColor: Colors.white,
              elevation: 1.0,
              backgroundColor: theme.backgroundColor,
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItemDetails itemDetails) {
    final key = Key("tab-button-${itemDetails.name}");
    return BottomNavigationBarItem(
      icon: Image.asset(
        itemDetails.defaultIconPath,
        key: key,
      ),
      label: itemDetails.name,
      backgroundColor: Colors.white,
      activeIcon: Image.asset(
        itemDetails.activeIconPath,
        key: key,
      ),
    );
  }
}
