import 'package:dttv/src/core/authentication_controller.dart';
import 'package:dttv/src/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  final AuthenticationController _authmanagerController =
      Get.put(AuthenticationController());

  SplashPage({Key? key}) : super(key: key);

  Future<void> initializeSettings() async {
    _authmanagerController.checkLoginStatus();
    await Future.delayed(const Duration(microseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return const HomePage();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CupertinoActivityIndicator(
            animating: true,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
