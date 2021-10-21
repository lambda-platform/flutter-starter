import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:lambdastarter/ui/common/TopBar.dart';
import 'package:lambdastarter/ui/common/custom_header.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';
import 'package:lambdastarter/utils/custom_icons.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> with WidgetsBindingObserver {
  RxBool notificationSwitch = false.obs;
  RxBool locationSwitch = false.obs;

  void checkPermissions() async {
    var locationStatus = await Permission.location.status;
    var notificationStatus = await Permission.notification.status;
    if (locationStatus.isGranted) {
      locationSwitch.value = true;
    }
    else{
      locationSwitch.value = false;
    }
    if (notificationStatus.isGranted) {
      notificationSwitch.value = true;
    }
    else{
      notificationSwitch.value = false;
    }
    // print(locationStatus.isDenied);
    // print(locationStatus.isGranted);
    // print(locationStatus.isLimited);
    // print(locationStatus.isPermanentlyDenied);
    // print(locationStatus.isRestricted);
  }

  @override
  void initState() {
    checkPermissions();
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResumed();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

   void onResumed(){
     checkPermissions();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(context, "Тохиргоо"),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: textGrey,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: secondaryColor,
                          ),
                          child: Icon(
                            CustomIcons.notification,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          'Мэдэгдэл',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: dark,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Switch(
                        activeColor: mainColor,
                        value: notificationSwitch.value,
                        onChanged: (value){
                          openAppSettings();
                        }
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: textGrey,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: secondaryColor,
                          ),
                          child: Icon(
                            CustomIcons.location,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          'Байршил өгөх эсэх',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: dark,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Switch(
                        activeColor: mainColor,
                        value: locationSwitch.value,
                        onChanged: (value) async {
                          var locationStatus = await Permission.location.status;
                          if (locationStatus.isDenied) {
                            loc.Location location = new loc.Location();

                            late bool _serviceEnabled;
                            late loc.PermissionStatus _permissionGranted;
                            late loc.LocationData _locationData;

                            _serviceEnabled = await location.serviceEnabled();
                            if (!_serviceEnabled) {
                              _serviceEnabled = await location.requestService();
                              if (!_serviceEnabled) {
                                return;
                              }
                            }

                            _permissionGranted = await location.hasPermission();
                            if (_permissionGranted ==
                                loc.PermissionStatus.denied) {
                              _permissionGranted =
                                  await location.requestPermission();
                              if (_permissionGranted !=
                                  loc.PermissionStatus.granted) {
                                return;
                              }
                            }
                            checkPermissions();
                          } else {
                            openAppSettings();
                          }
                          // location.value = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              //   child: Container(
              //     color: Color(0xFFf5f6f7),
              //   ),
              // ),
              // PreferredSize(
              //   preferredSize: Size.fromHeight(50.0),
              //   child: TabBar(
              //     labelColor: Colors.black,
              //     tabs: [
              //       Tab(
              //         text: 'Categories',
              //       ),
              //       Tab(
              //         text: 'Brands',
              //       ),
              //       Tab(
              //         text: 'Shops',
              //       )
              //     ], // list of tabs
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              //   child: Container(
              //     color: Color(0xFFf5f6f7),
              //   ),
              // ),
              // Expanded(
              //   child: TabBarView(
              //     children: [],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
