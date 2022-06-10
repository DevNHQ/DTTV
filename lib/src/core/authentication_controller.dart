import 'package:dttv/src/core/cache_manager.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController with CacheManager {
  late final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    await saveToken(token);
  }

  void checkLoginStatus() async {
    String? token = await getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}