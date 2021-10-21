import 'package:flutter/material.dart';
import 'package:lambdastarter/core/constants/firebase.dart';
import 'package:lambdastarter/core/controllers/appController.dart';
import 'package:lambda/modules/agent/agent_controller.dart';
import 'package:lambda/modules/network_util.dart';
import 'package:get/get.dart';
import 'package:lambdastarter/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AppController());
    Get.put(AgentController());
    Get.put(NetworkUtil());
  });
  runApp(MyApp());
}