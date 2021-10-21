import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubengineering/graphql/API/ds_request_conflicts.graphql.dart';
import 'package:ubengineering/ui/views/userRequest/userRequest.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ubengineering/ui/styles/_colors.dart';
import 'package:package_info/package_info.dart';
import 'package:lambda/modules/network_util.dart';
import 'package:lambda/modules/agent/agent_controller.dart';
import 'package:ubengineering/core/controllers/appController.dart';
import 'package:ubengineering/core/models/user.dart';

import 'package:ubengineering/core/constants/values.dart';

//GRAPHQL
import 'package:ubengineering/graphql/config.dart';
import 'package:ubengineering/graphql/API/districts.dart';

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final AgentController _agentController = Get.put(AgentController());
  final AppController _appController = Get.put(AppController());
  final NetworkUtil _http = Get.find();
  List<Districts$Query$Districts> districts = <Districts$Query$Districts>[];
  SharedPreferences? _prefs;
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void firebaseInit() async {
    messaging.requestPermission();
    var token = await messaging.getToken();
    print(token);
  }

  @override
  void initState() {
    // TODO: implement initState
    initApp();
    firebaseInit();
    super.initState();
  }

  Future<bool> checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var buildNumber = int.parse(packageInfo.buildNumber);

    String platform = Platform.isAndroid ? "android" : "ios";
    String versionCheckUrl = '/app_version.json';
    var response = await _http.get(versionCheckUrl);
    if (response != null &&
        response.data['android_build_number'] != null &&
        response.data['ios_build_number'] != null) {
      if (platform == "android") {
        print(buildNumber);
        print(response.data['android_build_number']);

        if (buildNumber < response.data['android_build_number']) {
          this._showDialog(
              response.data['android_force'], response.data['android_msg']);

          return true;
        } else {
          return false;
        }
      } else {
        if (buildNumber < response.data['ios_build_number']) {
          this._showDialog(
              response.data['ios_force'], response.data['ios_msg']);
          return true;
        } else {
          return false;
        }
      }
    }
    return false;
  }

  _setInitialScreen(bool isAuth) async {
    _prefs = await SharedPreferences.getInstance();
    if (isAuth && _agentController.userData.value != "") {
      _appController
          .setUser(User.fromJson(json.decode(_agentController.userData.value)));

      switch (_appController.user.value.role) {
        case 3:
          Get.offAllNamed('/citizen');
          break;
        case 4:
          Get.offAllNamed('/enricher');
          break;
        case 5:
          Get.offAllNamed('/fixer');
          break;
        default:
          Get.offAllNamed('/citizen');
      }
    } else {
      if (_prefs!.getBool("is_first_run") ?? true) {
        Get.offAllNamed("/introduction");
      } else {
        Get.offAllNamed("/login");
      }
    }
  }

  void initApp() async {
    try {
      _http.initNetwork(baseUrl);

      /*
      * GRAPHQL get data
      * */
      // final response = await client.execute(DistrictsQuery());
      // _appController.setDistricts(response.data!.districts);

      await _agentController.setAgent();
      bool isAuth = await _agentController.checkAuth();
      if (isAuth) {
        User user =
            new User.fromJson(jsonDecode(_agentController.userData.value));
        _appController.setUser(user);
      }
      _setInitialScreen(isAuth);
    } on Exception catch (error) {
      print(error);
      ErrorAlert();
    } catch (RuntimeBinderException) {
      ErrorAlert();
    }
  }

  Future<void> _launchWeb(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void ErrorAlert() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog

        return AlertDialog(
          title: new Text("Сервертэй холбогдож чадсангүй"),
          content: new Text("Интернет холболт оо шалгана уу"),
          actions: <Widget>[
            FlatButton(
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  "Дахин оролдох",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                initApp();
              },
            ),
          ],
        );
        ;
      },
    );
  }

  void _showDialog(bool isForce, String msg) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Шинэ хувилбар"),
          content: new Text(msg),
          actions: <Widget>[
            isForce
                ? Container()
                : FlatButton(
                    child: new Text(
                      "Алгасах",
                      style: TextStyle(color: Color(0xff565656)),
                    ),
                    onPressed: () async {},
                  ),
            FlatButton(
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  "Шинэчлэх",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                if (Platform.isAndroid) {
                  this._launchWeb(
                      "https://play.google.com/store/apps/details?id=mn.khankhulgun.mmhi");
                } else {
                  this._launchWeb(
                      "https://apps.apple.com/us/app/manaikhoroo/id1510196889?ls=1");
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
