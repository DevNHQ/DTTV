import 'package:dttv/src/core/authentication_controller.dart';
import 'package:get/instance_manager.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(() => AuthenticationController());
  }

}