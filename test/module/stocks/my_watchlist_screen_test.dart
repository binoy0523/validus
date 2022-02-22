import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mockito/mockito.dart';
import 'package:validus_coin/global_widgets/watchlist_item.dart';
import 'package:validus_coin/modules/stocks/my_watchlist_controller.dart';
import 'package:validus_coin/modules/stocks/my_watchlist_screen.dart';
import 'package:validus_coin/providers/api/stocks/stocks_api.dart';
import 'package:validus_coin/providers/api/stocks/get_all_stocks_response.dart';
import 'package:validus_coin/providers/api/stocks/stock.dart';
import '../../utils/test_mock.dart';
import '../../utils/test_mock.mocks.dart';

void main() {
  group("Watchlist screen on successful response", () {
    late Widget rootWidget;
    final StocksApi mockStocksApi = MockStocksApi();
    final successResponse = GetAllStocksResponse.fromJson(mockResponse);

    setUp(() {
      setupMockInjection();
      when(mockStocksApi.getAllStocks()).thenAnswer((realInvocation) async => successResponse);
      rootWidget = MaterialApp(
        home: Material(
          child: GetBuilder<MyWatchListController>(
            init: MyWatchListController(stocksApi: mockStocksApi),
            builder: (_) => MyWatchListScreen(),
          ),
        ),
      );
    });

    testWidgets('Renders list with WatchListItem widget', (WidgetTester tester) async {
      await tester.pumpWidget(rootWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsNWidgets(1));
      expect(find.byType(WatchListItem), findsNWidgets(3));
    });
  });
}
