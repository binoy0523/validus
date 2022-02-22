import 'package:get/get.dart';
import 'package:validus_coin/core/values/assets_manager.dart';
import 'package:validus_coin/core/values/string_manager.dart';
import 'package:validus_coin/modules/shared/base_controller.dart';
import 'package:validus_coin/modules/tab_manager/tab_item.dart';

/// Controller for the tab bar.
class TabBarController extends BaseController {
  /// Create new instance of [TabBarController]
  TabBarController({StringManager? stringManager, AssetsManager? assetsManager})
      : _stringManager = stringManager ?? Get.find<StringManager>(),
        _assetsManager = assetsManager ?? Get.find<AssetsManager>();

  final StringManager _stringManager;

  final AssetsManager _assetsManager;

  /// The currently active tab
  final Rxn<TabItem> selectedTab = Rxn<TabItem>(TabItem.stocks);

  /// The tab items displayed in the bottom navigation bar
  Map<TabItem, TabItemDetails> get tabItems => {
        TabItem.stocks: TabItemDetails(
          defaultIconPath: _assetsManager.stockIcon,
          activeIconPath: _assetsManager.stockIconActive,
          name: _stringManager.stocksTabTitle,
        ),
        TabItem.profile: TabItemDetails(
          defaultIconPath: _assetsManager.profileIcon,
          activeIconPath: _assetsManager.profileIconActive,
          name: _stringManager.profileTabTitle,
        ),
      };
}
