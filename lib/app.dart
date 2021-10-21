import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubengineering/ui/styles/_colors.dart';
import 'package:ubengineering/router.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'UB engineering',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: mainThemeColor,
        ),
        initialRoute: '/',
        getPages: AppRouter.routes);
  }
}
