import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lambda/plugins/data_form/loader.dart';
import 'package:ubengineering/core/constants/values.dart';
import 'package:ubengineering/core/controllers/appController.dart';
import 'package:ubengineering/ui/common/api_error.dart';
import 'package:ubengineering/ui/styles/_colors.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:ubengineering/utils/date.dart';

class EnrichmentScreen extends StatefulWidget {
  final VoidCallback openEndDrawer;
  EnrichmentScreen(this.openEndDrawer);

  @override
  _EnrichmentScreenState createState() => _EnrichmentScreenState();
}

class _EnrichmentScreenState extends State<EnrichmentScreen> {
  final AppController _appController = Get.put(AppController());

  Future<dynamic> _getData() async {
    late int folderId;
    var data = [];
    Uri rootUrl = Uri.parse("$gisUrl/api/resource/?parent=0");
    http.Response response = await http.get(rootUrl,
        headers: <String, String>{'authorization': _appController.basicAuth});
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var i = 0; i < jsonResponse.length; i++) {
        if (jsonResponse[i]['resource']['display_name'] == "Мобайл аппд") {
          folderId = jsonResponse[i]['resource']['id'];
        }
      }
    }
    Uri url = Uri.parse("$gisUrl/api/resource/?parent=$folderId");
    http.Response enrichResponse = await http.get(url,
        headers: <String, String>{'authorization': _appController.basicAuth});
    if (enrichResponse.statusCode == 200) {
      var jsonEnrich = convert.jsonDecode(enrichResponse.body);
      for (var i = 0; i < jsonEnrich.length; i++) {
        if (jsonEnrich[i]['resource']['cls'] == "vector_layer") {
          data.add(jsonEnrich[i]);
        }
      }
    }
    return data;
  }

  late Future<dynamic> _func;

  @override
  void initState() {
    _func = _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
      ),
      child: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Сайн байна уу?,',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: -0.5,
                      color: dark,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    _appController.user.value.firstName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      letterSpacing: -0.5,
                      color: Color(0xFF333333),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  widget.openEndDrawer();
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Color(
                        0xFFBEBAB3,
                      ),
                    ),
                  ),
                  child: Icon(Icons.menu),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Баяжуулалт хийх мэдээлэл',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                      letterSpacing: -0.5,
                      color: dark,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder<dynamic>(
                    future: _func,
                    builder: (context, snapshot) {
                      Widget children;
                      if (snapshot.hasData) {
                        children = Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/addEnrichment',
                                        arguments: snapshot.data[index]
                                            ['resource']['id']);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 15.0,
                                      top: 18.0,
                                      bottom: 18.0,
                                      right: 10.0,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.0,
                                        color: grey,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          16.0,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            snapshot.data[index]['resource']
                                                    ['display_name']
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0,
                                              letterSpacing: -0.5,
                                              color: dark,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: grey,
                                          size: 30.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (snapshot.hasError && snapshot.connectionState == ConnectionState.done) {
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
                    }),
              ],
            ),
          )
        ],
      )),
    );
  }
}
