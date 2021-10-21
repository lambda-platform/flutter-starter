import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lambdastarter/core/constants/values.dart';
import 'package:lambdastarter/graphql/API/arrived_request_detail.dart';
import 'package:lambdastarter/graphql/API/send_request_detail.graphql.dart';
import 'package:lambdastarter/graphql/config.dart';
import 'package:lambdastarter/ui/common/api_error.dart';
import 'package:lambdastarter/ui/common/custom_header.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';
import 'package:intl/intl.dart';

class ArrivedRequestDetailScreen extends StatefulWidget {
  @override
  _ArrivedRequestDetailScreenState createState() =>
      _ArrivedRequestDetailScreenState();
}

class _ArrivedRequestDetailScreenState
    extends State<ArrivedRequestDetailScreen> {
  final PageController carouselController = PageController(
    initialPage: 0,
  );

  var requestID = Get.arguments;

  Future<dynamic> _getData() async {
    final response = await client.execute(
      ArrivedRequestDetailQuery(
        variables: ArrivedRequestDetailArguments(
          requestID: requestID.toString(),
        ),
      ),
    );
    return response.data!.dsRequestConflicts;
  }

  late Future<dynamic> func;

  @override
  void initState() {
    func = _getData();
    super.initState();
  }

  int activeIndicator = 1;
  int decideActiveIndicator = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(context, 'Ирсэн хүсэлт'),
      body: SafeArea(
        child: FutureBuilder<dynamic>(
          future: func,
          builder: (context, snapshot) {
            Widget children;
            if (snapshot.hasData) {
              List<dynamic> images = [];
              if (snapshot.data[0].reqImage != "") {
                String stringList = snapshot.data[0].reqImage;
                images = jsonDecode(stringList);
              }
              Container status;
              switch (snapshot.data[0].typeId) {
                case 1:
                  status = Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      color: mainColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Яаралтай',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  );
                  break;
                case 2:
                  status = Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      color: Color(0xFF5BA092),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Хэвийн',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  );
                  break;
                case 4:
                  status = Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      color: bgSecondColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Дунд зэрэг',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  );
                  break;
                default:
                  status = Container();
              }
              children = LayoutBuilder(
                builder: (context, constrant) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[0].name.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                      letterSpacing: -0.5,
                                      color: dark,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    snapshot.data[0].description.toString(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: textDarkGrey,
                                      height: 1.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.schedule,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            DateFormat('yyyy/MM/d hh:mm aaa')
                                                .format(
                                                    snapshot.data[0].createdAt),
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Color(
                                                  0xFF78746D,
                                                )),
                                          )
                                        ],
                                      ),
                                      status
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: images.length > 0 ? 181.0 : 0.0,
                              child: PageView.builder(
                                onPageChanged: (page) {
                                  setState(() {
                                    activeIndicator = page + 1;
                                  });
                                },
                                scrollDirection: Axis.horizontal,
                                controller: carouselController,
                                itemCount:
                                    images.length > 0 ? images.length : 0,
                                itemBuilder: (context, index) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                    child: Image.network(
                                      baseUrl + images[index]['response'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: images.length > 0 ? 26.0 : 0.0,
                            ),
                            Container(
                              height: 8.0,
                              alignment: Alignment.center,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    images.length > 0 ? images.length : 0,
                                itemBuilder: (context, index) => Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4.0),
                                        ),
                                        color: activeIndicator == (index + 1)
                                            ? bgSecondColor
                                            : Color(0xFFD5D4D4),
                                      ),
                                      height: 6.0,
                                      width: activeIndicator == (index + 1)
                                          ? 16.0
                                          : 6.0,
                                    ),
                                    images.length != (index + 1)
                                        ? SizedBox(
                                            width: 12.0,
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              MediaQuery.of(context).size.width,
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
                            Get.toNamed(
                              '/aboutRepair',
                              arguments: requestID,
                            );
                          },
                          child: Text(
                            'Хариу илгээх',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else if (snapshot.hasError &&
                snapshot.connectionState == ConnectionState.done) {
              children = GestureDetector(
                onTap: () {
                  setState(() {
                    func = _getData();
                  });
                },
                child: ApiError(),
              );
            } else {
              children = Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return children;
          },
        ),
      ),
    );
  }
}
