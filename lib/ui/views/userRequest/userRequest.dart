import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lambda/plugins/data_form/lambda_data_form.dart';
// import 'package:lambda/plugins/data_form/data_form.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:lambda/plugins/data_form/loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lambdastarter/core/controllers/appController.dart';
import 'package:lambdastarter/graphql/API/getDistrictId.dart';
import 'package:lambdastarter/graphql/API/getKhorooId.graphql.dart';
import 'package:lambdastarter/graphql/config.dart';
import 'package:lambdastarter/ui/common/api_error.dart';
import 'package:lambdastarter/ui/common/custom_header.dart';
import 'package:lambdastarter/ui/helpers/success_modal.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class UserRequest extends StatefulWidget {
  const UserRequest({Key? key}) : super(key: key);

  @override
  _UserRequestState createState() => _UserRequestState();
}

class _UserRequestState extends State<UserRequest> {
  final AppController _appController = Get.put(AppController());
  final GlobalKey<LambdaDataFormState> _LambdaDataFormState = new GlobalKey<LambdaDataFormState>();
  Location location = new Location();
  SharedPreferences? _prefs;

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  late String? ssid;
  late String? duureg;
  late String? khoroo;
  bool canGetLocation = false;
  late int? districtID;
  late int? khorooID;

  late Future<bool> _getData;

  var arg = Get.arguments;

  var objectID;

  Future<bool> getCurrentLocation() async {

    return true;
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }

    _locationData = await location.getLocation();
    if (_locationData != null) {
      Uri url = Uri.parse(
          "https://cloudgis.mn/map/v1/poi/searchPoaXYCloseOrder?ssid=${_appController.ssid}");
      var headers = {
        'Content-type': 'application/json',
      };
      final msg = jsonEncode({
        // "X": _locationData.longitude.toString(),
        // "Y": _locationData.latitude.toString(),
        "X": "106.90340099485992",
        "Y": "47.90106295570456",
        "RANGE": 17,
      });
      http.Response response =
          await http.post(url, headers: headers, body: msg);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['stat'] == 1) {
          duureg = jsonResponse["t_region10_data"][0]['sum']
              .toString()
              .replaceAll(" дүүрэг", "")
              .replaceAll(" ", "-");
          khoroo = jsonResponse["t_region10_data"][0]['horoo_bag']
              .toString()
              .substring(
                  0,
                  jsonResponse["t_region10_data"][0]['horoo_bag']
                      .toString()
                      .indexOf("-"));
          print(duureg);
          print(khoroo);
          var districtResponse = await client.execute(
            GetDistrictIdQuery(
              variables: GetDistrictIdArguments(
                districtName: duureg.toString(),
              ),
            ),
          );
          districtID = districtResponse.data?.districts![0].id;

          var khorooResponse = await client.execute(
            GetKhorooIdQuery(
              variables: GetKhorooIdArguments(
                districtID: districtID.toString(),
                khorooName: khoroo!,
              ),
            ),
          );

          khorooID = khorooResponse.data?.regions![0].id;
          canGetLocation = true;
          return canGetLocation;
        } else if (jsonResponse['stat'] == 1) {
          Uri url = Uri.parse(
              "https://www.cloudgis.mn/map/v1/init/pc?mskey=4cd9035c6f03e2928e975e7390468440");
          http.Response response = await http.get(url);
          if (response.statusCode == 200) {
            var jsonResponse = jsonDecode(response.body);
            _appController.ssid = jsonResponse['ssid'].toString();
            getCurrentLocation();
          }
        } else {
          canGetLocation = false;
        }
      }
    }
    return canGetLocation;
  }

  Map<String, dynamic> hiddenData = {
    "requested_user_id": 3,
    "status_id": 1,
  };

  @override
  void initState() {
    if (arg != null) {
      objectID = "UBENGR${arg[0]['resource']}F${arg[0]['feature']}";
    }
    print(objectID);
    _getData = getCurrentLocation();
    super.initState();
  }

  // @override
  // void onSuccess(dynamic data) async {
  //   AwesomeDialog(
  //     context: context,
  //     dialogType: DialogType.SUCCES,
  //     animType: AnimType.BOTTOMSLIDE,
  //     headerAnimationLoop: false,
  //     title: 'Амжилттай',
  //     desc: 'Мэдээлэл илгээгдлээ',
  //     btnOkOnPress: () {
  // switch (_appController.user.value.role) {
  //   case 3:
  //     Get.offAllNamed('/citizen', arguments: 0);
  //     break;
  //   case 4:
  //     Get.offAllNamed('/enricher');
  //     break;
  //   case 5:
  //     Get.offAllNamed('/fixer');
  //     break;
  //   default:
  // }
  //     },
  //     btnOkText: "Хаах",
  //   ).show();
  // }

  @override
  void onSuccess(dynamic data) async {
    successModal(context, 'Мэдээлэл амжилттай илгээгдээ.', () {
      switch (_appController.user.value.role) {
        case 3:
          Get.offAllNamed('/citizen', arguments: 0);
          break;
        case 4:
          Get.offAllNamed('/enricher');
          break;
        case 5:
          Get.offAllNamed('/fixer');
          break;
        default:
      }
    }, 'Хаах');
  }
  void onReady(){
   setState(() {
     _LambdaDataFormState.currentState!.setModel("districts_id", 1, "select");
   });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: CustomHeader(context, 'Санал хүсэлт илгээх'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<bool>(
            future: _getData,
            builder: (context, snapshot) {
              Widget child;
              if (snapshot.hasData) {
                child = Container(
                  padding:
                      EdgeInsets.only(right: 0, top: 0, left: 0, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      LambdaDataForm(
                        "10",
                        key: _LambdaDataFormState,
                        onReady: onReady,
                        onSuccess: onSuccess,
                        saveBtnText: "Илгээх",
                        // offlineSave: false,
                        hiddenValues: hiddenData,
                        // editMode: true,
                        // editId: 6,
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                child = GestureDetector(
                  onTap: () {
                    setState(() {
                      _getData = getCurrentLocation();
                    });
                  },
                  child: ApiError(),
                );
              } else {
                child = Loader();
              }
              return child;
            },
          ),
        ),
      ),
    );
  }
}
