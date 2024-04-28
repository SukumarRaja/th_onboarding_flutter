import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => SizedBox(),
      transition: Transition.zoom,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
