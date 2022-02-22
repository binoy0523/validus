import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validus_coin/core/values/string_manager.dart';
import 'package:validus_coin/providers/api/stocks/stock.dart';
import 'package:intl/intl.dart';

/// List item widget for watch list.
class WatchListItem extends StatelessWidget {
  /// Create new instance of [WatchListItem]
  WatchListItem({
    Key? key,
    required this.stock,
    StringManager? stringManager,
  })  : _stringManager = stringManager ?? Get.find<StringManager>(),
        super(key: key);

  /// Stock model object
  final Stock stock;

  final StringManager _stringManager;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stock.stockName.toUpperCase(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 4,
            ),
            _StockFieldItem(fieldName: _stringManager.priceField, value: stock.price.toString()),
            _StockFieldItem(fieldName: _stringManager.dayGain, value: stock.dayGain.toString()),
            _StockFieldItem(fieldName: _stringManager.lastTrade, value: _convertToTime(stock.lastTrade)),
            _StockFieldItem(fieldName: _stringManager.extendedHrs, value: _convertToTime(stock.extendedHours)),
            _PercentageChangeField(fieldName: _stringManager.percentageChange, value: stock.percentageChange),
          ],
        ),
      ),
    );
  }

  String _convertToTime(String duration) {
    final timestamp = int.parse(duration);
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate = DateFormat('hh:mm a').format(date);
    return formattedDate;
  }
}

class _StockFieldItem extends StatelessWidget {
  const _StockFieldItem({
    Key? key,
    required this.fieldName,
    required this.value,
  }) : super(key: key);

  final String fieldName;

  final String value;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fieldName,
            style: TextStyle(
              fontSize: 18,
              color: theme.colorScheme.onSurface,
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class _PercentageChangeField extends StatelessWidget {
  const _PercentageChangeField({
    Key? key,
    required this.fieldName,
    required this.value,
  }) : super(key: key);

  final String fieldName;

  final double value;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final roundedPercentage = value.toStringAsFixed(2);
    final changeColor = value >= 0 ? Colors.green : Colors.red;
    final icon = value >= 0 ? Icons.arrow_drop_up : Icons.arrow_drop_down;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fieldName,
            style: TextStyle(
              fontSize: 18,
              color: theme.colorScheme.onSurface,
            ),
            // textAlign: TextAlign.left,
          ),
          Row(
            children: [
              Icon(
                icon,
                color: changeColor,
              ),
              Text(
                "% $roundedPercentage",
                style: TextStyle(fontSize: 18, color: changeColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
