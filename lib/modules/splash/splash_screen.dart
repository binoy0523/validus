import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final _theme = Theme.of(context);
    return Container(
      color: _theme.backgroundColor,
      child: Center(
        child: Text("Validus Coin"),
      ),
    );
  }

}
