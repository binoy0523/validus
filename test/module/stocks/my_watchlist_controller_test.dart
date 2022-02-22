import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:validus_coin/modules/stocks/my_watchlist_controller.dart';
import 'package:validus_coin/providers/api/stocks/stocks_api.dart';
import 'package:validus_coin/providers/api/stocks/get_all_stocks_response.dart';
import '../../utils/test_mock.dart';
import '../../utils/test_mock.mocks.dart';

void main() {
  late MyWatchListController controller;
  final StocksApi mockStocksApi = MockStocksApi();

  group("Controller initialized", () {
    final successResponse = GetAllStocksResponse.fromJson(mockResponse);

    setUp(() {
      when(mockStocksApi.getAllStocks()).thenAnswer((realInvocation) async => successResponse);
      controller = MyWatchListController(stocksApi: mockStocksApi);
    });
    test("StockApi getAllStocks get called", () {
      controller.onInit();
      verify(mockStocksApi.getAllStocks());
      expect(controller.status.isLoading, equals(true));
    });
  });
}
