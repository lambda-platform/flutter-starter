import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lambda/plugins/data_form/loader.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:ubengineering/core/constants/values.dart';
import 'package:ubengineering/core/controllers/appController.dart';
import 'package:ubengineering/graphql/API/qrRepairHistory.graphql.dart';
import 'package:ubengineering/graphql/config.dart';
import 'package:ubengineering/ui/styles/_colors.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Attribute extends StatefulWidget {
  Attribute({Key? key}) : super(key: key);

  @override
  _AttributeState createState() => _AttributeState();
}

class _AttributeState extends State<Attribute>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final AppController _appController = Get.put(AppController());
  late TabController _tabController;
  late PageController carouselController;

  QRViewController? controller = Get.arguments[0];
  var arg = Get.arguments;

  void _tabBarControllerListener() {
    if (!_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  bool get wantKeepAlive => true;

  Future<dynamic> _getData() async {
    var mnJsonResponse = [];
    var fildJsonResponse;
    Map<String, Object> finalData;
    Uri mnNameUrl =
        Uri.parse("$gisUrl/api/resource/${Get.arguments[1]}");
    http.Response mnNameResponse = await http.get(mnNameUrl,
        headers: <String, String>{'authorization': _appController.basicAuth});
    if (mnNameResponse.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(mnNameResponse.body);
      mnJsonResponse = jsonResponse['feature_layer']['fields'];
    }
    Uri fieldUrl = Uri.parse(
        "$gisUrl/api/resource/${Get.arguments[1]}/feature/${Get.arguments[2]}");
    http.Response fieldResponse = await http.get(fieldUrl,
        headers: <String, String>{'authorization': _appController.basicAuth});
    if (fieldResponse.statusCode == 200) {
      fildJsonResponse = convert.jsonDecode(fieldResponse.body);
    }
    var keyList = [];
    keyList = fildJsonResponse['fields'].keys.toList();
    for (var i = 0; i < mnJsonResponse.length; i++) {
      if (mnJsonResponse[i]['keyname'] == keyList[i]) {
        mnJsonResponse[i].addAll({
          "value": fildJsonResponse['fields']['${mnJsonResponse[i]['keyname']}']
        });
      }
    }
    var queryResponse = await client.execute(
      QrRepairHistoryQuery(
        variables: QrRepairHistoryArguments(
            item_id: "UBENGR${Get.arguments[1]}F${Get.arguments[2]}"),
      ),
    );
    finalData = {
      'fields': mnJsonResponse,
      'description': fildJsonResponse['extensions']['description'] ?? "",
      'attachments': fildJsonResponse['extensions']['attachment'] ?? [],
      'repairHistory': queryResponse.data!.dsRequestConflicts ?? [],
    };
    return finalData;
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'authorization': _appController.basicAuth},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  late Future<dynamic> _func;

  @override
  void initState() {
    _func = _getData();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    carouselController = PageController(initialPage: 0,);
    _tabController.addListener(_tabBarControllerListener);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController.removeListener(_tabBarControllerListener);
    controller!.resumeCamera();
    controller!.dispose();
    carouselController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    controller!.resumeCamera();
    super.deactivate();
  }

  int activeIndicator = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                controller!.resumeCamera().whenComplete(() => Get.back());
              },
              child: Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: grey,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.chevron_left,
                  color: dark,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Объектын мэдээлэл',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    letterSpacing: -0.5,
                    color: dark,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.chevron_left,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          onTap: (index) {
            setState(() {
              _tabController.index = index;
            });
          },
          labelColor: Color(0xFFE3562A),
          isScrollable: true,
          unselectedLabelColor: Color(0xFF78746D),
          indicatorColor: Color(0xFFE3562A),
          indicatorWeight: 3.0,
          tabs: [
            Tab(
              text: 'Аттрибут',
            ),
            Tab(
              text: 'Тайлбар',
            ),
            Tab(
              text: 'Хавсралт',
            ),
            Tab(
              text: 'Засварын түүх',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<dynamic>(
          future: _func,
          builder: (context, snapshot) {
            Widget children;
            List<String> images = [];

            if (snapshot.hasData) {
              String url = "$gisUrl";
              for (var i = 0; i < snapshot.data['attachments'].length; i++) {
                if (snapshot.data['attachments'][i]['is_image']) {
                  images.add(url +
                      "/api/resource/${arg[1]}/feature/${arg[2]}/attachment/${snapshot.data["attachments"][i]["id"]}/download");
                }
                // int index = snapshot.data['attachments'][i]['mime_type']
                //     .toString()
                //     .indexOf('/');
                // int index2 = snapshot.data['attachments'][i]['mime_type']
                // .toString()
                // .indexOf('/');
                // if (snapshot.data['attachments'][i]['mime_type']
                //         .toString()
                //         .substring(0, index) ==
                //     "image") {
                //   if(snapshot.data['attachments'][i][]){

                //   }
                // }
              }

              List<Widget> fields = [];
              for (var i = 0; i < snapshot.data['fields'].length; i++) {
                if (snapshot.data['fields'][i]['grid_visibility']) {
                  if (snapshot.data['fields'][i]['datatype'] == "DATE") {
                    fields.add(Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(snapshot.data['fields'][i]
                                      ['display_name']
                                  .toString()),
                            ),
                            Expanded(
                              flex: 6,
                              child: Text(
                                snapshot.data['fields'][i]['value']['year']
                                        .toString() +
                                    "/" +
                                    snapshot.data['fields'][i]['value']['month']
                                        .toString() +
                                    "/" +
                                    snapshot.data['fields'][i]['value']['day']
                                        .toString(),
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Divider(),
                      ],
                    ));
                  } else if (snapshot.data['fields'][i]['datatype'] == "TIME") {
                    fields.add(Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(snapshot.data['fields'][i]
                                      ['display_name']
                                  .toString()),
                            ),
                            Expanded(
                              flex: 6,
                              child: Text(
                                snapshot.data['fields'][i]['value']['hour'].toString() +
                                    ":" +
                                    (snapshot.data['fields'][i]['value']['minute'].toString().length < 2
                                        ? snapshot.data['fields'][i]['value']
                                                    ['minute']
                                                .toString() +
                                            "0"
                                        : snapshot.data['fields'][i]['value']
                                                ['minute']
                                            .toString()) +
                                    ":" +
                                    (snapshot.data['fields'][i]['value']['second']
                                                .toString()
                                                .length <
                                            2
                                        ? snapshot.data['fields'][i]['value']
                                                    ['second']
                                                .toString() +
                                            "0"
                                        : snapshot.data['fields'][i]['value']
                                                ['second']
                                            .toString()),
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Divider(),
                      ],
                    ));
                  } else if (snapshot.data['fields'][i]['datatype'] ==
                      "DATETIME") {
                    fields.add(Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(snapshot.data['fields'][i]
                                      ['display_name']
                                  .toString()),
                            ),
                            Expanded(
                              flex: 6,
                              child: Text(
                                snapshot.data['fields'][i]['value']['year'].toString() +
                                    "-" +
                                    snapshot.data['fields'][i]['value']['month']
                                        .toString() +
                                    "-" +
                                    snapshot.data['fields'][i]['value']['day']
                                        .toString() +
                                    " " +
                                    snapshot.data['fields'][i]['value']['hour']
                                        .toString() +
                                    ":" +
                                    (snapshot.data['fields'][i]['value']['minute'].toString().length < 2
                                        ? snapshot.data['fields'][i]['value']['minute'].toString() +
                                            "0"
                                        : snapshot.data['fields'][i]['value']
                                                ['minute']
                                            .toString()) +
                                    ":" +
                                    (snapshot.data['fields'][i]['value']['second']
                                                .toString()
                                                .length <
                                            2
                                        ? snapshot.data['fields'][i]['value']
                                                    ['second']
                                                .toString() +
                                            "0"
                                        : snapshot.data['fields'][i]['value']
                                                ['second']
                                            .toString()),
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Divider(),
                      ],
                    ));
                  } else {
                    fields.add(Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(snapshot.data['fields'][i]
                                      ['display_name']
                                  .toString()),
                            ),
                            Expanded(
                              flex: 6,
                              child: Text(
                                snapshot.data['fields'][i]['value'].toString(),
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Divider(),
                      ],
                    ));
                  }
                }
              }
              children = Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: fields,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data['description'].toString(),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              children: [
                                images.length > 0
                                    ? Column(
                                        children: [
                                          Container(
                                            height:
                                                images.length > 0 ? 181.0 : 0.0,
                                            child: PageView.builder(
                                              onPageChanged: (page) {
                                                setState(() {
                                                  activeIndicator = page + 1;
                                                });
                                              },
                                              scrollDirection: Axis.horizontal,
                                              controller: carouselController,
                                              itemCount: images.length,
                                              itemBuilder: (context, index) =>
                                                  Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20.0),
                                                  ),
                                                  child: Image.network(
                                                    images[index],
                                                    // fit: BoxFit.,
                                                    headers: <String, String>{
                                                      'authorization':
                                                          _appController
                                                              .basicAuth
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                images.length > 0 ? 26.0 : 0.0,
                                          ),
                                          Container(
                                            height: 8.0,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: images.length,
                                              itemBuilder: (context, index) =>
                                                  Row(
                                                children: [
                                                  AnimatedContainer(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(4.0),
                                                      ),
                                                      color: activeIndicator ==
                                                              (index + 1)
                                                          ? bgSecondColor
                                                          : Color(0xFFD5D4D4),
                                                    ),
                                                    width: activeIndicator ==
                                                            (index + 1)
                                                        ? 16.0
                                                        : 6.0,
                                                    duration: const Duration(
                                                      milliseconds: 400,
                                                    ),
                                                    height: 6.0,
                                                  ),
                                                  // Container(
                                                  // decoration: BoxDecoration(
                                                  //   borderRadius:
                                                  //       BorderRadius.all(
                                                  //     Radius.circular(4.0),
                                                  //   ),
                                                  //   color: activeIndicator ==
                                                  //           (index + 1)
                                                  //       ? bgSecondColor
                                                  //       : Color(0xFFD5D4D4),
                                                  // ),
                                                  //   height: 6.0,
                                                  // width: activeIndicator ==
                                                  //         (index + 1)
                                                  //     ? 16.0
                                                  //     : 6.0,
                                                  // ),
                                                  images.length != (index + 1)
                                                      ? SizedBox(
                                                          width: 12.0,
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30.0,
                                          ),
                                        ],
                                      )
                                    : Container(),
                                Builder(
                                  builder: (context) {
                                    List<Widget> childs = [];
                                    for (var i = 0;
                                        i < snapshot.data['attachments'].length;
                                        i++) {
                                      if (!snapshot.data['attachments'][i]
                                          ['is_image']) {
                                        childs.addAll([
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                    snapshot.data['attachments']
                                                            [i]['name']
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Color(0xFF5D6373),
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  _launchInBrowser(url +
                                                      "/api/resource/${Get.arguments[1]}/feature/${Get.arguments[2]}/attachment/${snapshot.data["attachments"][i]["id"]}/download");
                                                },
                                                child: Icon(
                                                  Icons.download,
                                                  color: mainColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          snapshot.data['attachments'].length !=
                                                  (i + 1)
                                              ? Divider(
                                                  height: 30,
                                                )
                                              : Container(),
                                        ]);
                                      }
                                    }
                                    return childs.length > 0
                                        ? Container(
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 20.0,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 20.0,
                                              horizontal: 15.0,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: darkGrey,
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  16.0,
                                                ),
                                              ),
                                            ),
                                            child: Column(
                                              children: childs,
                                            ))
                                        : Container();
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20.0, right: 20.0),
                          child: ListView.builder(
                            itemCount: snapshot.data['repairHistory'].length,
                            itemBuilder: (context, i) {
                              List<dynamic> fixerImages = [];
                              if (snapshot
                                      .data['repairHistory'][i].fixerImage !=
                                  "") {
                                String stringList = snapshot
                                    .data['repairHistory'][i].fixerImage;
                                fixerImages = convert.jsonDecode(stringList);
                              }
                              List<Widget> imageCarousel = [];
                              for (var j = 0; j < fixerImages.length; j++) {
                                imageCarousel.add(
                                  CachedNetworkImage(
                                    alignment: Alignment.topCenter,
                                    fit: BoxFit.fill,
                                    imageUrl:
                                        baseUrl + fixerImages[j]['response'],
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            20.0,
                                          ),
                                        ),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                );
                              }
                              var activeImage = 0.obs;
                              Widget drawIndicator() {
                                List<Widget> indicators = [];
                                for (var i = 0; i < fixerImages.length; i++) {
                                  indicators.add(
                                    Column(
                                      children: [
                                        // activeImage.value == i
                                        //     ? Container(
                                        //         height: 6,
                                        //         width: 16,
                                        //         decoration: BoxDecoration(
                                        //           borderRadius:
                                        //               BorderRadius.circular(50),
                                        //           color: bgSecondColor,
                                        //         ),
                                        //       )
                                        //     : Container(
                                        //         height: 6,
                                        //         width: 6,
                                        //         decoration: BoxDecoration(
                                        //           borderRadius:
                                        //               BorderRadius.circular(50),
                                        //           color: bgNonActive,
                                        //         ),
                                        //       ),
                                        AnimatedContainer(
                                          height: 6,
                                          width:
                                              activeImage.value == i ? 16 : 6,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: activeImage.value == i
                                                ? bgSecondColor
                                                : bgNonActive,
                                          ),
                                          duration:
                                              const Duration(milliseconds: 300),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: indicators,
                                );
                              }

                              return Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: grey,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        children: [
                                          imageCarousel.length > 0
                                              ? Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          topRight:
                                                              Radius.circular(
                                                            20.0,
                                                          ),
                                                        ),
                                                      ),
                                                      height: 200.0,
                                                      child: PageView(
                                                        onPageChanged: (index) {
                                                          activeImage.value =
                                                              index;
                                                        },
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        children: imageCarousel,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Obx(
                                                      () => drawIndicator(),
                                                    ),
                                                  ],
                                                )
                                              : Container(),
                                          Container(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.schedule,
                                                      size: 18.0,
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      DateFormat(
                                                              'yyyy/MM/d hh:mm aaa')
                                                          .format(snapshot
                                                              .data[
                                                                  'repairHistory']
                                                                  [i]
                                                              .endedAt),
                                                      style: TextStyle(
                                                        color: textDarkGrey,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        'Хариуцсан байгууллага:',
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        snapshot
                                                            .data[
                                                                'repairHistory']
                                                                [i]
                                                            .nameOrg,
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          color:
                                                              Color(0xFF5D6373),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        'Засвар хийсэн:',
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "${snapshot.data['repairHistory'][i].fixerFirstName} ${snapshot.data['repairHistory'][i].fixerLastName}",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          color:
                                                              Color(0xFF5D6373),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // SizedBox(
                                                //   height: 10.0,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     Expanded(
                                                //       flex: 2,
                                                //       child: Text(
                                                //         'Албан тушаал:',
                                                //         style: TextStyle(
                                                //           fontSize: 12.0,
                                                //           color: Colors.black,
                                                //           fontWeight:
                                                //               FontWeight.bold,
                                                //         ),
                                                //       ),
                                                //     ),
                                                //     Expanded(
                                                //       child: Text(
                                                //         'Цахилгааны инженер',
                                                //         style: TextStyle(
                                                //           fontSize: 12.0,
                                                //           color:
                                                //               Color(0xFF5D6373),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //   ],
                                                // ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    snapshot
                                                        .data['repairHistory']
                                                            [i]
                                                        .fixerDescription,
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Color(0xFF5D6373),
                                                      height: 1.5,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  _tabController.index != 3
                      ? Container(
                          padding: const EdgeInsets.only(
                            bottom: 20.0,
                            left: 20.0,
                            right: 20.0,
                          ),
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                double.infinity,
                                56,
                              ),
                              primary: mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  16,
                                ),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                              Get.toNamed('/userRequest', arguments: [
                                {
                                  'resource': arg[1],
                                  'feature': arg[2],
                                }
                              ]);
                            },
                            child: Text(
                              'Санал хүсэлт илгээх',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              );
            } else if (snapshot.hasError) {
              children = Center(
                child: Text('Ресурсын мэдээлэл байхгүй.'),
              );
            } else {
              children = Loader();
            }
            return children;
          },
        ),
      ),
    );
  }
}
