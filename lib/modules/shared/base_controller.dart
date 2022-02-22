import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:logger/logger.dart';

/// The base for all the controllers.
abstract class BaseController extends GetxController {
  /// a [logger] for all controllers to enable easy logging from anywhere inside the controller
  Logger get logger => Get.find<Logger>();
}
