import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final pageController = PageController(viewportFraction: 1.0, keepPage: true);
  int _currentPage = 0;
  late Timer timer;
  @override
  Future<void> onInit() async {
    // autoPlay();
    super.onInit();
  }

  @override
  Future<void> onClose() async {
    pageController.dispose();
    // timer.cancel();
    super.onClose();
  }

  void autoPlay() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.slowMiddle,
      );
    });
  }
}
