import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ubengineering/ui/views/init.dart';
import 'package:ubengineering/ui/views/home/home.dart';
import 'package:ubengineering/ui/views/authentication/login.dart';
import 'package:ubengineering/ui/views/chart/chart.dart';
import 'package:ubengineering/ui/views/profile/profile.dart';


class AppRouter {
  AppRouter._();

  static final routes = <GetPage>[
    GetPage(name: '/', page: () => InitScreen()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/chart', page: () => ChartExample()),
    GetPage(name: '/profile', page: () => ProfileScreen()),
  ];
}