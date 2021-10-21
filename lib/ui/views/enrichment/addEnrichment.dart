import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gql/language.dart';
import 'package:lambda/plugins/data_form/loader.dart';
import 'package:ubengineering/core/constants/values.dart';
import 'package:ubengineering/core/controllers/appController.dart';
import 'package:ubengineering/ui/common/api_error.dart';
import 'package:ubengineering/ui/common/custom_header.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:ubengineering/ui/helpers/error_modal.dart';
import 'package:ubengineering/ui/helpers/success_modal.dart';
import 'package:ubengineering/ui/styles/_colors.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart' as fileDio;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:location/location.dart';

class AddEnrichmentScreen extends StatefulWidget {
  AddEnrichmentScreen({Key? key}) : super(key: key);

  @override
  _AddEnrichmentScreenState createState() => _AddEnrichmentScreenState();
}

class _AddEnrichmentScreenState extends State<AddEnrichmentScreen> {
  final AppController _appController = Get.put(AppController());
  var resourceId = Get.arguments;

  Location location = new Location();

  late Map<String, dynamic> fields = {};

  final ImagePicker _picker = ImagePicker();

  List<Map<String, dynamic>> files = [];

  final TextEditingController descController = new TextEditingController();

  var geo_type;

  bool userChangeLocation = false;

  var districts = [];

  var districtVal = 'Сонгох';

  var khoroos = ['Сонгох'];

  var khorooVal = 'Сонгох';

  var streets = ['Сонгох'];

  var streetVal = 'Сонгох';

  var numbers = ['Сонгох'];

  var numberVal = 'Сонгох';

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  late String? ssid;
  late String? duureg;
  late String? khoroo;
  late String? street;
  late String? number;

  bool canGetLocation = false;

  final _formKey = GlobalKey<FormState>();

  Future<bool> getCurrentLocation() async {
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
      final msg = convert.jsonEncode({
        "X": _locationData.longitude.toString(),
        "Y": _locationData.latitude.toString(),
        // "X": "106.84528912138528",
        // "Y": "47.913696920503966",
        "RANGE": 17,
      });
      http.Response response =
          await http.post(url, headers: headers, body: msg);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        if (jsonResponse['stat'] == 1) {
          duureg = jsonResponse["t_region10_data"][0]['sum']
              .toString()
              .replaceAll(" дүүрэг", "");
          khoroo = jsonResponse["t_region10_data"][0]['horoo_bag'].toString();
          street = jsonResponse["t_region10_data"][0]['street'].toString();
          number = jsonResponse["t_region10_data"][0]['number'].toString();
          setState(() {
            districtVal = duureg!;
          });
          await getKhorooData();
          for (var i = 0; i < khoroos.length; i++) {
            if (khoroos[i] == khoroo!) {
              setState(() {
                khorooVal = khoroo!;
              });
              break;
            }
          }
          await getStreetData();
          if (khorooVal != 'Сонгох') {
            for (var i = 0; i < streets.length; i++) {
              if (streets[i] == street!) {
                setState(() {
                  streetVal = street!;
                });
                break;
              }
            }
          }
          await getNumberData();
          if (streetVal != 'Сонгох') {
            for (var i = 0; i < numbers.length; i++) {
              if (numbers[i] == number!) {
                setState(() {
                  numberVal = number!;
                });
                break;
              }
            }
          }
          canGetLocation = true;
          return canGetLocation;
        } else if (jsonResponse['stat'] == 1) {
          Uri url = Uri.parse(
              "https://www.cloudgis.mn/map/v1/init/pc?mskey=4cd9035c6f03e2928e975e7390468440");
          http.Response response = await http.get(url);
          if (response.statusCode == 200) {
            var jsonResponse = convert.jsonDecode(response.body);
            _appController.ssid = jsonResponse['ssid'].toString();
            getCurrentLocation();
          }
        } else {
          canGetLocation = false;
          return canGetLocation;
        }
      }
    }
    return canGetLocation;
  }

  Future<dynamic> _getData() async {
    await getCurrentLocation();
    Uri duuregUrl = Uri.parse(
        "https://cloudgis.mn/map/v1/address/sumnames?ssid=${_appController.ssid}");
    var duuregRes = await http
        .post(duuregUrl, body: <String, String>{"PREFCITY": "Улаанбаатар"});
    if (duuregRes.statusCode == 200) {
      districts = [];
      var jsonRes = convert.jsonDecode(duuregRes.body);
      for (var i = 0; i < jsonRes['names'].length; i++) {
        if (jsonRes['names'][i] == null) {
          districts.add('Сонгох');
        } else {
          districts.add(jsonRes['names'][i]);
        }
      }
    }
    Uri rootUrl = Uri.parse("$gisUrl/api/resource/$resourceId");
    http.Response response = await http.get(rootUrl,
        headers: <String, String>{'authorization': _appController.basicAuth});
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var i = 0; i < jsonResponse['feature_layer']['fields'].length; i++) {
        fields["${jsonResponse['feature_layer']['fields'][i]['keyname']}"] = "";
      }
      geo_type = jsonResponse['vector_layer']['geometry_type'];
      return jsonResponse;
    }
  }

  void galleryPicker() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      files.add({
        'name': image!.name,
        'path': image.path,
        'isImage': true,
      });
    });
    // print(image!.path);
  }

  void cameraPicker() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      files.add({
        'name': photo!.name,
        'path': photo.path,
        'isImage': true,
      });
    });
    // print(photo!.path);
  }

  void pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      for (var i = 0; i < result.files.length; i++) {
        setState(() {
          files.add({
            'name': result.files[i].name,
            'path': result.files[i].path,
            'isImage': (result.files[i].extension == "jpeg" ||
                result.files[i].extension == "jpg" ||
                result.files[i].extension == "png"),
          });
        });
      }
    } else {
      // User canceled the picker
    }
  }

  Future<dynamic> getKhorooData() async {
    Uri khorooUrl = Uri.parse(
        "https://cloudgis.mn/map/v1/address/bagnames?ssid=${_appController.ssid}");
    var khorooRes = await http.post(khorooUrl, body: <String, String>{
      "PREFCITY": "Улаанбаатар",
      'SUM': districtVal,
    });
    if (khorooRes.statusCode == 200) {
      khoroos = ['Сонгох'];
      khorooVal = 'Сонгох';
      streets = ['Сонгох'];
      streetVal = 'Сонгох';
      numbers = ['Сонгох'];
      numberVal = 'Сонгох';
      setState(() {
        var jsonRes = convert.jsonDecode(khorooRes.body);
        for (var i = 0; i < jsonRes['names'].length; i++) {
          if (jsonRes['names'][i] != null) {
            khoroos.add(jsonRes['names'][i]);
          }
        }
      });
    }
  }

  Future<dynamic> getStreetData() async {
    Uri streetUrl = Uri.parse(
        "https://cloudgis.mn/map/v1/address/streetnames?ssid=${_appController.ssid}");
    var streetRes = await http.post(streetUrl, body: <String, String>{
      "PREFCITY": "Улаанбаатар",
      'SUM': districtVal,
      'BAG': khorooVal,
    });
    if (streetRes.statusCode == 200) {
      streets = ['Сонгох'];
      streetVal = 'Сонгох';
      numbers = ['Сонгох'];
      numberVal = 'Сонгох';
      setState(() {
        var jsonRes = convert.jsonDecode(streetRes.body);
        for (var i = 0; i < jsonRes['names'].length; i++) {
          if (jsonRes['names'][i] != null) {
            streets.add(jsonRes['names'][i]);
          }
        }
      });
    }
  }

  Future<dynamic> getNumberData() async {
    Uri numberUrl = Uri.parse(
        "https://cloudgis.mn/map/v1/address/nonames?ssid=${_appController.ssid}");
    var numberRes = await http.post(numberUrl, body: <String, String>{
      "PREFCITY": "Улаанбаатар",
      'SUM': districtVal,
      'BAG': khorooVal,
      'STREET': streetVal,
    });
    if (numberRes.statusCode == 200) {
      numbers = ['Сонгох'];
      numberVal = 'Сонгох';
      setState(() {
        var jsonRes = convert.jsonDecode(numberRes.body);
        for (var i = 0; i < jsonRes['names'].length; i++) {
          if (jsonRes['names'][i] != null) {
            numbers.add(jsonRes['names'][i]);
          }
        }
      });
    }
  }

  Future<void> _load() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40.0,
                width: 40.0,
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        );
      },
    );
  }

  void _sendData() async {
    _load();
    var lat;
    var lon;
    Uri url = Uri.parse("$gisUrl/api/resource/$resourceId/feature/");
    var sendData = {};
    sendData['fields'] = fields;
    if (userChangeLocation) {
      Uri getLocUrl = Uri.parse(
          "https://cloudgis.mn/map/v1/address/search/?ssid=${_appController.ssid}");
      var body = new Map<String, dynamic>();
      body['PREFCITY'] = "Улаанбаатар";
      body['SUM'] = districtVal;
      body['BAG'] = khorooVal;
      body['STREET'] = streetVal;
      body['NO'] = numberVal;
      var response = await http.post(
        getLocUrl,
        body: body,
      );
      var jsonResponse = convert.jsonDecode(response.body);
      if (jsonResponse['t_address'].length == 1) {
        lon = jsonResponse['t_address'][0]['adrs_lon'];
        lat = jsonResponse['t_address'][0]['adrs_lat'];
      } else {
        lon = _locationData.longitude.toString();
        lat = _locationData.latitude.toString();
      }
    } else {
      lon = _locationData.longitude.toString();
      lat = _locationData.latitude.toString();
    }
    if (geo_type == "POINT") {
      sendData['geom'] = "$geo_type ($lon $lat)";
    } else {
      sendData['geom'] = "$geo_type ($lon $lat, $lon $lat)";
    }
    var jsonBody = convert.jsonEncode(sendData);
    http.Response response = await http.post(
      url,
      headers: <String, String>{'authorization': _appController.basicAuth},
      body: jsonBody,
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      try {
        var uploadedFiles = [];

        for (var i = 0; i < files.length; i++) {
          var dio = fileDio.Dio();
          var fileType = lookupMimeType(files[i]['name']);
          String type = fileType!.substring(0, fileType.indexOf('/'));
          String subType =
              fileType.substring(fileType.indexOf('/') + 1, fileType.length);
          fileDio.FormData formData = fileDio.FormData.fromMap({
            'file': await fileDio.MultipartFile.fromFile(
              files[i]['path'],
              filename: files[i]['name'],
              contentType: MediaType(type, subType),
            ),
          });
          var response = await dio.post(
            "$gisUrl/api/component/file_upload/",
            data: formData,
          );

          if (response.statusCode == 200) {
            uploadedFiles.add(response.data);
          }
        }
        var attachments = [];
        for (var i = 0; i < uploadedFiles.length; i++) {
          attachments.add({
            'name': uploadedFiles[i]['upload_meta'][0]['name'],
            'size': uploadedFiles[i]['upload_meta'][0]['size'],
            'mime_type': uploadedFiles[i]['upload_meta'][0]['mime_type'],
            'file_upload': {
              'id': uploadedFiles[i]['upload_meta'][0]['id'],
              'size': uploadedFiles[i]['upload_meta'][0]['size'],
            },
          });
        }
        Uri updateUrl = Uri.parse(
          "$gisUrl/api/resource/$resourceId/feature/${jsonResponse['id']}",
        );
        sendData['extensions'] = {
          'description': descController.text,
          'attachment': attachments,
        };
        sendData.remove('geom');
        var jsonBodyData = convert.jsonEncode(sendData);
        http
            .put(updateUrl,
                headers: <String, String>{
                  'authorization': _appController.basicAuth
                },
                body: jsonBodyData)
            .then((value) {
          Navigator.of(context, rootNavigator: true).pop();
          successModal(context, 'Ажилттай', () {
            Navigator.of(context, rootNavigator: true).pop();
            Get.back();
          }, 'Буцах');
        }).onError((error, stackTrace) {
          Navigator.of(context, rootNavigator: true).pop();
          errorModal(context, 'Алдаа гарлаа', () {
            Navigator.of(context, rootNavigator: true).pop();
          }, 'Хаах');
        });
      } catch (e) {
        Navigator.of(context, rootNavigator: true).pop();
        errorModal(context, 'Алдаа гарлаа', () {
          Navigator.of(context, rootNavigator: true).pop();
        }, 'Хаах');
      }
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      errorModal(context, 'Алдаа гарлаа', () {
        Navigator.of(context, rootNavigator: true).pop();
      }, 'Хаах');
    }
  }

  late Future<dynamic> _func;

  @override
  void initState() {
    _func = _getData();
    super.initState();
  }

  textInput(field, keyType) {
    late Widget child;
    switch (field['datatype']) {
      case "DATE":
        child = Container(
          margin: new EdgeInsets.only(top: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(field['display_name'].toString(),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0)),
              new TextFormField(
                key: Key(fields["${field['keyname']}"].toString()),
                initialValue: fields["${field['keyname']}"] != ""
                    ? "${fields["${field['keyname']}"]['year']}-${fields["${field['keyname']}"]['month']}-${fields["${field['keyname']}"]['day']}"
                    : "",
                readOnly: true,
                controller: null,
                onTap: () async {
                  final DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: fields["${field['keyname']}"] == ""
                        ? DateTime.now()
                        : DateTime.utc(
                            fields["${field['keyname']}"]['year'],
                            fields["${field['keyname']}"]['month'],
                            fields["${field['keyname']}"]['day']),
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2025),
                    helpText: "${field['display_name']} сонгох",
                    cancelText: "Болих",
                    confirmText: "Сонгох",
                  );
                  if (date != null && date != fields["${field['keyname']}"]) {
                    setState(() {
                      fields["${field['keyname']}"] = {
                        'day': date.day,
                        'month': date.month,
                        'year': date.year,
                      };
                    });
                  }
                },
                keyboardType: keyType,
                decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 18.0),
                  isDense: true,
                  hintText: field['display_name'].toString(),
                  helperText: "",
                  filled: true,
                  fillColor: Color(0xFFFFF5EE),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFF3705A),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFF3705A),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFF3705A),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        break;
      case "TIME":
        var data;
        if (fields["${field['keyname']}"] != "") {
          data = fields["${field['keyname']}"] as Map;
        }
        child = Container(
          margin: new EdgeInsets.only(top: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(field['display_name'].toString(),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0)),
              new TextFormField(
                key: Key(fields["${field['keyname']}"].toString()),
                initialValue: fields["${field['keyname']}"].toString() != ""
                    ? "${data['hour']}:${data['minute']}:00"
                    : "",
                onTap: () async {
                  TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: fields["${field['keyname']}"] != ""
                        ? TimeOfDay(hour: data['hour'], minute: data["minute"])
                        : TimeOfDay.now(),
                    cancelText: 'Болих',
                    confirmText: 'Сонгох',
                    helpText: "${field['display_name']} сонгох",
                  );
                  if (time != null && time != fields["${field['keyname']}"]) {
                    setState(() {
                      fields["${field['keyname']}"] = {
                        "hour": time.hour,
                        "minute": time.minute,
                        "second": 0
                      };
                    });
                  }
                },
                readOnly: true,
                controller: null,
                keyboardType: keyType,
                decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 18.0),
                  isDense: true,
                  hintText: field['display_name'].toString(),
                  helperText: "",
                  filled: true,
                  fillColor: Color(0xFFFFF5EE),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFF3705A),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFF3705A),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFF3705A),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        break;
      case "DATETIME":
        child = Container(
          margin: new EdgeInsets.only(top: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(field['display_name'].toString(),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0)),
              new TextFormField(
                key: Key(fields["${field['keyname']}"].toString()),
                initialValue: fields["${field['keyname']}"].toString() != ""
                    ? "${fields["${field['keyname']}"]['year']}-${fields["${field['keyname']}"]['month']}-${fields["${field['keyname']}"]['day']} ${fields["${field['keyname']}"]['hour']}:${fields["${field['keyname']}"]['minute']}:00"
                    : "",
                onTap: () async {
                  final DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: fields["${field['keyname']}"] == ""
                        ? DateTime.now()
                        : DateTime.utc(
                            fields["${field['keyname']}"]['year'],
                            fields["${field['keyname']}"]['month'],
                            fields["${field['keyname']}"]['day']),
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2025),
                    helpText: "${field['display_name']} сонгох",
                    cancelText: "Болих",
                    confirmText: "Сонгох",
                  );
                  if (date != null) {
                    TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: fields["${field['keyname']}"] != ""
                          ? TimeOfDay(
                              hour: fields["${field['keyname']}"]['hour'],
                              minute: fields["${field['keyname']}"]['minute'])
                          : TimeOfDay.now(),
                      cancelText: 'Болих',
                      confirmText: 'Сонгох',
                      helpText: "${field['display_name']} сонгох",
                    );
                    if (time != null) {
                      fields["${field['keyname']}"] = {
                        'year': date.year,
                        'month': date.month,
                        'day': date.day,
                        'hour': time.hour,
                        'minute': time.minute,
                        'second': 0,
                      };
                      setState(() {});
                    }
                  }
                },
                readOnly: true,
                controller: null,
                keyboardType: keyType,
                decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 18.0),
                  isDense: true,
                  hintText: field['display_name'].toString(),
                  helperText: "",
                  filled: true,
                  fillColor: Color(0xFFFFF5EE),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFF3705A),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFF3705A),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFF3705A),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        break;
      default:
        child = Container(
          margin: new EdgeInsets.only(top: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(field['display_name'].toString(),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0)),
              new TextFormField(
                controller: null,
                onChanged: (text) {
                  fields["${field['keyname']}"] =
                      field['datatype'] != "STRING" ? int.parse(text) : text;
                },
                keyboardType: keyType,
                decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 18.0),
                  isDense: true,
                  hintText: field['display_name'].toString(),
                  helperText: "",
                  filled: true,
                  fillColor: Color(0xFFFFF5EE),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFF3705A),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFF3705A),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFF3705A),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(context, 'Мэдээлэл нэмэх'),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: FutureBuilder<dynamic>(
              future: _func,
              builder: (context, snapshot) {
                Widget children;
                if (snapshot.hasData) {
                  children = ListView.builder(
                    itemCount: snapshot.data['feature_layer']['fields'].length,
                    itemBuilder: (context, index) {
                      var keyType;
                      switch (snapshot.data['feature_layer']['fields'][index]
                          ['datatype']) {
                        case "STRING":
                          keyType = TextInputType.text;
                          break;
                        case "BIGINT":
                          keyType = TextInputType.number;
                          break;
                        case "INTEGER":
                          keyType = TextInputType.number;
                          break;
                        case "REAL":
                          keyType = TextInputType.number;
                          break;
                        case "DATE":
                          keyType = TextInputType.datetime;
                          break;
                        default:
                          keyType = TextInputType.text;
                      }
                      return snapshot.data['feature_layer']['fields'][index]
                              ['grid_visibility']
                          ? Column(
                              children: [
                                textInput(
                                    snapshot.data['feature_layer']['fields']
                                        [index],
                                    keyType),
                                snapshot.data['feature_layer']['fields']
                                            .length ==
                                        (index + 1)
                                    ? Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              new Text('тайлбар',
                                                  style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.0)),
                                              new TextFormField(
                                                controller: descController,
                                                keyboardType: keyType,
                                                decoration: new InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10.0,
                                                          vertical: 18.0),
                                                  isDense: true,
                                                  helperText: "",
                                                  filled: true,
                                                  fillColor: Color(0xFFFFF5EE),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      width: 1.0,
                                                      color: Color(0xFFF3705A),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      width: 1.0,
                                                      color: Color(0xFFF3705A),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      width: 1.0,
                                                      color: Color(0xFFF3705A),
                                                    ),
                                                  ),
                                                ),
                                                maxLines: 4,
                                              ),
                                              new Text(
                                                'файл',
                                                style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 20),
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFFFF5EE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      width: 1.0,
                                                      color: Color(0xFFF3705A),
                                                    )),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 20,
                                                        vertical: 15,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: cameraPicker,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                    16,
                                                                  ),
                                                                ),
                                                                border:
                                                                    Border.all(
                                                                  width: 1.0,
                                                                  color: Color(
                                                                      0xFFF3705A),
                                                                ),
                                                              ),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              // margin:
                                                              //     const EdgeInsets
                                                              //         .all(20),
                                                              // padding:
                                                              //     const EdgeInsets
                                                              //         .all(10),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(Icons
                                                                      .photo_camera),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    'Камера',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap:
                                                                galleryPicker,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                    16,
                                                                  ),
                                                                ),
                                                                border:
                                                                    Border.all(
                                                                  width: 1.0,
                                                                  color: Color(
                                                                      0xFFF3705A),
                                                                ),
                                                              ),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              // padding:
                                                              //     const EdgeInsets
                                                              //         .all(10),
                                                              // margin:
                                                              //     const EdgeInsets
                                                              //         .all(20),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(Icons
                                                                      .collections),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    'Gallery',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: pickFile,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                    16,
                                                                  ),
                                                                ),
                                                                border:
                                                                    Border.all(
                                                                  width: 1.0,
                                                                  color: Color(
                                                                      0xFFF3705A),
                                                                ),
                                                              ),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              // padding:
                                                              //     const EdgeInsets
                                                              //         .all(10),
                                                              // margin:
                                                              //     const EdgeInsets
                                                              //         .all(20),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(Icons
                                                                      .file_copy),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    'File',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        List<Widget> children =
                                                            [];
                                                        for (var i = 0;
                                                            i < files.length;
                                                            i++) {
                                                          children
                                                              .add(Container(
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                files[i][
                                                                        'isImage']
                                                                    ? Container(
                                                                        margin: const EdgeInsets.only(
                                                                            bottom:
                                                                                10.0),
                                                                        width:
                                                                            40,
                                                                        height:
                                                                            40,
                                                                        child: Image
                                                                            .file(
                                                                          File(
                                                                            files[i]['path'],
                                                                          ),
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        ),
                                                                      )
                                                                    : Container(
                                                                        margin: const EdgeInsets.only(
                                                                            bottom:
                                                                                10.0),
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/file.png',
                                                                        ),
                                                                      ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    margin: const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            10),
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                    child: Text(
                                                                      files[i][
                                                                          'name'],
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    bottom: 10,
                                                                  ),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        files.removeAt(
                                                                            i);
                                                                      });
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .delete,
                                                                      color:
                                                                          mainColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ));
                                                        }
                                                        return Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 20.0,
                                                            bottom:
                                                                files.length ==
                                                                        0
                                                                    ? 0
                                                                    : 10.0,
                                                          ),
                                                          child: Column(
                                                            children: children,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  new Text('дүүрэг',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16.0)),
                                                  Container(
                                                    height: 75,
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      isDense: false,
                                                      itemHeight: 48.0,
                                                      isExpanded: true,
                                                      value: districtVal,
                                                      onChanged: (val) {
                                                        userChangeLocation =
                                                            true;
                                                        setState(() {
                                                          districtVal = val!;
                                                          if (val == 'Сонгох') {
                                                            khoroos = [
                                                              'Сонгох'
                                                            ];
                                                            khorooVal =
                                                                'Сонгох';
                                                            streets = [
                                                              'Сонгох'
                                                            ];
                                                            streetVal =
                                                                'Сонгох';
                                                            numbers = [
                                                              'Сонгох'
                                                            ];
                                                            numberVal =
                                                                'Сонгох';
                                                          } else {
                                                            getKhorooData();
                                                          }
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (value == 'Сонгох') {
                                                          return 'Талбарыг бөглөнө үү!';
                                                        }
                                                        return null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        hintText: "",
                                                        helperText: "",
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFFFFF5EE),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                            color: Color(
                                                                0xFFF3705A),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                            color: Color(
                                                                0xFFF3705A),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                            color: Color(
                                                                0xFFF3705A),
                                                          ),
                                                        ),
                                                      ),
                                                      items: districts.map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (dynamic district) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: district
                                                              .toString(),
                                                          child: new Text(
                                                            district.toString(),
                                                            style: new TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  new Text('хороо',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16.0)),
                                                  Container(
                                                    height: 75,
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      isDense: false,
                                                      itemHeight: 48.0,
                                                      isExpanded: true,
                                                      value: khorooVal,
                                                      onChanged: (val) {
                                                        userChangeLocation =
                                                            true;
                                                        setState(() {
                                                          khorooVal = val!;
                                                          if (val == 'Сонгох') {
                                                            streets = [
                                                              'Сонгох'
                                                            ];
                                                            streetVal =
                                                                'Сонгох';
                                                            numbers = [
                                                              'Сонгох'
                                                            ];
                                                            numberVal =
                                                                'Сонгох';
                                                          } else {
                                                            getStreetData();
                                                          }
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (value == 'Сонгох') {
                                                          return 'Талбарыг бөглөнө үү!';
                                                        }
                                                        return null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        hintText: "",
                                                        helperText: "",
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFFFFF5EE),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                            color: Color(
                                                                0xFFF3705A),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                            color: Color(
                                                                0xFFF3705A),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                            color: Color(
                                                                0xFFF3705A),
                                                          ),
                                                        ),
                                                      ),
                                                      items: khoroos.map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (dynamic khoroo) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value:
                                                              khoroo.toString(),
                                                          child: new Text(
                                                            khoroo.toString(),
                                                            style: new TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  new Text('гудамж',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16.0)),
                                                  Container(
                                                    height: 75,
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      isDense: false,
                                                      itemHeight: 48.0,
                                                      isExpanded: true,
                                                      value: streetVal,
                                                      onChanged: (val) {
                                                        userChangeLocation =
                                                            true;
                                                        setState(() {
                                                          streetVal = val!;
                                                          if (val == 'Сонгох') {
                                                            numbers = [
                                                              'Сонгох'
                                                            ];
                                                            numberVal =
                                                                'Сонгох';
                                                          } else {
                                                            getNumberData();
                                                          }
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (value == 'Сонгох') {
                                                          return 'Талбарыг бөглөнө үү!';
                                                        }
                                                        return null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        hintText: "",
                                                        helperText: "",
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFFFFF5EE),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                            color: Color(
                                                                0xFFF3705A),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                            color: Color(
                                                                0xFFF3705A),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                            color: Color(
                                                                0xFFF3705A),
                                                          ),
                                                        ),
                                                      ),
                                                      items: streets.map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (dynamic street) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value:
                                                              street.toString(),
                                                          child: new Text(
                                                            street.toString(),
                                                            style: new TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  new Text('тоот',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16.0)),
                                                  Container(
                                                    height: 75,
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      isDense: false,
                                                      itemHeight: 48.0,
                                                      isExpanded: true,
                                                      value: numberVal,
                                                      onChanged: (val) {
                                                        userChangeLocation =
                                                            true;
                                                        setState(() {
                                                          numberVal = val!;
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (value == 'Сонгох') {
                                                          return 'Талбарыг бөглөнө үү!';
                                                        }
                                                        return null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        hintText: "",
                                                        helperText: "",
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFFFFF5EE),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                            color: Color(
                                                                0xFFF3705A),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                            color: Color(
                                                                0xFFF3705A),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                            color: Color(
                                                                0xFFF3705A),
                                                          ),
                                                        ),
                                                      ),
                                                      items: numbers.map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (dynamic number) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value:
                                                              number.toString(),
                                                          child: new Text(
                                                            number.toString(),
                                                            style: new TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                fixedSize: Size(
                                                  double.infinity,
                                                  56,
                                                ),
                                                primary: mainColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    16,
                                                  ),
                                                ),
                                                elevation: 0,
                                              ),
                                              // onPressed: _sendData,
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  _sendData();
                                                }
                                              },
                                              child: Text(
                                                'Илгээх',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ],
                            )
                          : Container();
                    },
                  );
                } else if (snapshot.hasError &&
                    snapshot.connectionState == ConnectionState.done) {
                  children = GestureDetector(
                    onTap: () {
                      setState(() {
                        _func = _getData();
                      });
                    },
                    child: ApiError(),
                  );
                } else {
                  children = Loader();
                }
                return children;
              },
            ),
          ),
        ),
      ),
    );
  }
}
