import 'package:admin_racing/backend/middleware/dio_middleware.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../modules/home/home_ctrl.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeCTRL());// Initialize LoginCTRL here
    Get.put(DioMiddleware(),permanent: true);// Initialize LoginCTRL here
  }
}