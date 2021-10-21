import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lambdastarter/ui/views/init.dart';
import 'package:lambdastarter/ui/views/home/home.dart';
import 'package:lambdastarter/ui/views/authentication/login.dart';
import 'package:lambdastarter/ui/views/chart/chart.dart';
import 'package:lambdastarter/ui/views/profile/profile.dart';


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