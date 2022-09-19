import 'package:dttv/src/commons/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    BuildContext? context,
    String? title,
    Widget? widgetTitle,
    VoidCallback? onLeadingAction,
    List<Widget>? actions,
    double? elevation = 1.0,
    PreferredSizeWidget? bottom,
    bool showBackIcon = true,
    bool automaticallyImplyLeading = true,
    bool centerTitle = true,
    Color? appBarColor,
    dynamic leadingIcon,
  }) : super(
          key: key,
          title: Text(
            title ?? '',
            style: const TextStyle(color: Colors.black),
          ),
          automaticallyImplyLeading: automaticallyImplyLeading,
          backgroundColor: appBarColor ?? backgroundColor,
          leading: showBackIcon
              ? InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                  ),
                )
              : null,
          centerTitle: centerTitle,
          actions: actions,
          elevation: elevation,
          bottom: bottom,
        );
}
