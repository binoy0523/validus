import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:validus_coin/core/values/string_manager.dart';
import 'package:validus_coin/global_widgets/app_bottom_navigation_bar.dart';
import 'package:validus_coin/modules/profile/profile_screen.dart';
import 'package:validus_coin/modules/profile/profile_screen_controller.dart';
import 'package:validus_coin/modules/stocks/my_watchlist_controller.dart';
import 'package:validus_coin/modules/stocks/my_watchlist_screen.dart';
import 'package:validus_coin/modules/tab_manager/tab_bar_controller.dart';
import 'package:validus_coin/modules/tab_manager/tab_item.dart';

/// Tab bar screen widget.
class TabBarScreen extends StatefulWidget {
  /// Create a new tab bar screen
  TabBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  /// The in memory list of the current active pages
  final Map<TabItem, Widget> _activeTabPages = {
    TabItem.stocks: GetBuilder<MyWatchListController>(
      init: MyWatchListController(),
      builder: (_) => MyWatchListScreen(),
    ),
    TabItem.profile: GetBuilder<ProfileScreenController>(
      init: ProfileScreenController(),
      builder: (_) => ProfileScreen(),
    ),
  };

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TabBarController>();
    return Scaffold(
        body: Obx(
          () => Stack(
            children: _activeTabPages.keys
                .map(
                  (TabItem tabItem) => Offstage(
                    offstage: tabItem != controller.selectedTab.value,
                    child: _activeTabPages[tabItem],
                  ),
                )
                .toList(),
          ),
        ),
        bottomNavigationBar: Obx(
          () => AppBottomNavigationBar(
              currentTab: controller.selectedTab.value ?? TabItem.stocks,
              items: controller.tabItems,
              onSelectTab: (newTab) async {
                if (controller.selectedTab.value == newTab) {
                } else {
                  controller.selectedTab(newTab);
                }
              }),
        ));
  }
}
