import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final pageController = PageController(viewportFraction: 1.0, keepPage: true);
  int _currentPage = 0;
  late Timer timer;
  // late PageController controller;
  int currentPage = 0;
  List<String> listItem = ['Page 1', 'Page 2', 'Page 3', 'Page 4'];
  String textTest = 'Tiếng Việt';
  final List<String> unselected = [
    'A',
    'B',
    'C',
  ];
  final List<String> selected = [];

  // final unselectedListKey = GlobalKey<AnimatedListState>();
  // final selectedListKey = GlobalKey<AnimatedListState>();
  final List<GlobalKey> unselectedListKey = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];
  final List<GlobalKey> selectedListKey = [];
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

  String randomText(String data) {
    return (data.replaceAll(' ', '').split('')..shuffle())
        .join()
        .replaceAll('', ' / ');
  }

  List<String> randomList(String data) {
    return data.replaceAll(' ', '').split('');
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
