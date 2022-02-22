import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pull_to_refresh/src/indicator/waterdrop_header.dart';
import 'package:validus_coin/core/values/string_manager.dart';
import 'package:validus_coin/global_widgets/main_app_bar.dart';
import 'package:validus_coin/global_widgets/retry_state_update.dart';
import 'package:validus_coin/global_widgets/watchlist_item.dart';
import 'package:validus_coin/modules/stocks/my_watchlist_controller.dart';

class MyWatchListScreen extends GetView<MyWatchListController> {
  @override
  Widget build(BuildContext context) {
    final stringManager = Get.find<StringManager>();

    final theme = Theme.of(context);
    const defaultPadding = 16.0;

    return MainAppBar(
      title: stringManager.watchListTitle,
      child: controller.obx(
        (stocks) {
          if (stocks == null || stocks.isEmpty) {
            return Center(
              child: Text(stringManager.noWatchList),
            );
          }
          return SmartRefresher(
            controller: controller.refreshController,
            header: WaterDropHeader(
              waterDropColor: theme.colorScheme.primary,
            ),
            onRefresh: () => controller.getMyWatchList(),
            child:Padding(padding:EdgeInsets.only(top: defaultPadding) ,child:  ListView.separated(
              padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding, bottom: defaultPadding),
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: defaultPadding),
              itemBuilder: (_, index) {
                final stock = stocks.elementAt(index);
                return WatchListItem(stock: stock);
              },
              itemCount: stocks.length,
            ),),
          );
        },
        onError: (error) => RetryStateUpdate(
          errorMessage: error,
          onRetryPressed: () => controller.getMyWatchList(),
        ),
      ),
    );
  }
}
