import 'package:flutter/material.dart';
import 'package:ubengineering/core/constants/firebase.dart';
import 'package:ubengineering/core/controllers/appController.dart';
import 'package:lambda/modules/agent/agent_controller.dart';
import 'package:lambda/modules/network_util.dart';
import 'package:get/get.dart';
import 'package:ubengineering/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value){
    Get.put(AppController());
    Get.put(AgentController());
    Get.put(NetworkUtil());
  });
  runApp(MyApp());
}
