import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:validus_coin/modules/shared/base_controller.dart';
import 'package:validus_coin/providers/api/stocks/stock.dart';
import 'package:validus_coin/providers/api/stocks/stocks_api.dart';
import 'package:rxdart/rxdart.dart';

/// Controller for watchlist screen
class MyWatchListController extends BaseController with StateMixin<List<Stock>> {
  /// Create new instance of [MyWatchListController]
  MyWatchListController({
    StocksApi? stocksApi,
  }) : _stocksApi = stocksApi ?? Get.find<StocksApi>();

  final StocksApi _stocksApi;

  List<Stock> _stocks = List.empty();

  /// controls pull to refresh
  RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    getMyWatchList();
    super.onInit();
  }

  /// Fetch stocks list from server.
  Future getMyWatchList() async {
    change(null, status: RxStatus.loading());
    try {
      final stocksResponse = await _stocksApi.getAllStocks();
      _stocks = stocksResponse.stocks;
      change(_stocks, status: RxStatus.success());
    } catch (e) {
      logger.e("Something went wrong", e);
      change(_stocks, status: RxStatus.error());
    } finally {
      refreshController.refreshCompleted();
    }
  }
}
