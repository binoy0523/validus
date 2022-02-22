import 'package:get/instance_manager.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:validus_coin/core/theme/base/main_theme.dart';
import 'package:validus_coin/core/theme/dev_theme.dart';
import 'package:validus_coin/core/values/string_manager.dart';
import 'package:validus_coin/providers/api/stocks/stocks_api.dart';
import 'test_mock.mocks.dart';

@GenerateMocks(
  [Logger],
  customMocks: [
    MockSpec<StocksApi>(returnNullOnMissingStub: true),
  ],
)
void setupMockInjection() {
  Get
    ..put(_stringManager)
    ..put(_logger)
    ..put(_theme);
}

StringManager get _stringManager => const StringManager();
Logger get _logger => MockLogger();
MainTheme get _theme => const DevTheme();
final mockResponse = {
  "success": true,
  "statusCode": 200,
  "data": [
    {
      "id": "87-3221807",
      "stockName": "Buzzshare",
      "price": 65.53,
      "dayGain": 3.76,
      "lastTrade": "1636275300000",
      "extendedHours": "1639008000000",
      "lastPrice": 90.23
    },
    {
      "id": "54-6790627",
      "stockName": "Meezzy",
      "price": 84.75,
      "dayGain": 4.95,
      "lastTrade": "1636672727000",
      "extendedHours": "1639008000000",
      "lastPrice": 11.16
    },
    {
      "id": "51-3739672",
      "stockName": "Blogtag",
      "price": 70.64,
      "dayGain": 1.96,
      "lastTrade": "1637159463000",
      "extendedHours": "1639008000000",
      "lastPrice": 72.78
    },
  ],
};
