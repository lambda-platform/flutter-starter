import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ubengineering/core/models/user.dart';
import 'package:get/get.dart';
import 'package:ubengineering/graphql/API/districts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AppController extends GetxController {
  static AppController instance = Get.find();

  // String username = "khankhulgun";
  // String password = "khankhulgun";
  String username = "Munkhjin";
  String password = "Munkhjin";
  late String basicAuth;

  RxList<Districts$Query$Districts> districts =
      <Districts$Query$Districts>[].obs;
  Rx<User> user = User().obs;
  String? ssid;

  @override
  Future<void> onReady() async {
    super.onReady();
    setSsid();
    basicAuth = "Basic " +
        convert.base64Encode(convert.utf8.encode('$username:$password'));
  }

  setDistricts(List<Districts$Query$Districts>? districtsData) {
    if (districtsData != null) {
      districts.value = districtsData;
    }
  }

  setUser(User userData) {
    user.value = userData;
  }

  void setSsid() async {
    // _prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(
        "https://www.cloudgis.mn/map/v1/init/pc?mskey=4cd9035c6f03e2928e975e7390468440");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      ssid = jsonResponse['ssid'].toString();
      // _prefs!.setString('ssid', jsonResponse['ssid'].toString());
      // print(_prefs!.getString('Ssid'));
    }
  }
}
