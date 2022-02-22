import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:validus_coin/core/values/string_manager.dart';
import 'package:validus_coin/global_widgets/app_primary_button.dart';


/// A widget showing an error message and a retry button
/// This is used to show and retry GetX state errors
class RetryStateUpdate extends StatelessWidget {
  /// Create a new [RetryStateUpdate]
  RetryStateUpdate({
    Key? key,
    required this.errorMessage,
    required this.onRetryPressed,
    StringManager? stringManager,
  })  : _stringManager = stringManager ?? Get.find<StringManager>(),
        super(key: key);

  /// Error message to display to the user
  final String? errorMessage;

  /// The retry button has been pressed
  final VoidCallback onRetryPressed;

  final StringManager _stringManager;

  @override
  Widget build(BuildContext context) {
    const vSpace = SizedBox(height: 16);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage ?? _stringManager.defaultErrorText,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          vSpace,
          AppPrimaryButton(
            title: _stringManager.retry,
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}
