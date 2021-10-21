import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubengineering/core/constants/values.dart';
import 'package:ubengineering/graphql/API/send_request_detail.graphql.dart';
import 'package:ubengineering/graphql/config.dart';
import 'package:ubengineering/ui/common/api_error.dart';
import 'package:ubengineering/ui/common/custom_header.dart';
import 'package:ubengineering/ui/styles/_colors.dart';
import 'package:intl/intl.dart';

class SendRequestDetailScreen extends StatefulWidget {
  @override
  _SendRequestDetailScreenState createState() =>
      _SendRequestDetailScreenState();
}

class _SendRequestDetailScreenState extends State<SendRequestDetailScreen> {
  final PageController carouselController = PageController(
    initialPage: 0,
  );

  var requestID = Get.arguments;

  Future<dynamic> _getData() async {
    final response = await client.execute(SendRequestDetailQuery(
        variables:
            SendRequestDetailArguments(requestID: requestID.toString())));
    // print(response);
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
      appBar: CustomHeader(context, 'Илгээсэн хүсэлт'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder<dynamic>(
              future: func,
              builder: (context, snapshot) {
                Widget children;
                if (snapshot.hasData) {
                  List<dynamic> images = [];
                  if (snapshot.data[0].reqImage != "") {
                    String stringList = snapshot.data[0].reqImage;
                    images = jsonDecode(stringList);
                  }

                  List<dynamic> decide_images = [];
                  if (snapshot.data[0].fixerImage != "") {
                    String stringList = snapshot.data[0].fixerImage;
                    decide_images = jsonDecode(stringList);
                  }

                  Container status;
                  switch (snapshot.data[0].statusId) {
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
                            'Хүлээгдэж буй',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      );
                      break;
                    case 3:
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
                            'Шийдэгдсэн',
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
                          color: bgSecondColor,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Хуваарилагдсан',
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
                  children = Column(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          .format(snapshot.data[0].createdAt),
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
                      Column(
                        children: [
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
                              itemCount: images.length > 0 ? images.length : 0,
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
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: images.length > 0 ? images.length : 0,
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
                          SizedBox(
                            height: 50.0,
                          ),
                          snapshot.data[0].statusId == 3
                              ? Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 40.0,
                                        right: 15.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.reply),
                                              SizedBox(
                                                width: 12.0,
                                              ),
                                              Text(
                                                DateFormat(
                                                        'yyyy/MM/d hh:mm aaa')
                                                    .format(snapshot
                                                        .data[0].endedAt)
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: textDarkGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 17.0,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Шийдвэрлэгдсэн тухай',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20.0,
                                                letterSpacing: -0.5,
                                                color: dark,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Text(
                                            snapshot.data[0].fixerDescription
                                                .toString(),
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: textDarkGrey,
                                              height: 1.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.0,
                                    ),
                                    decide_images.length > 0
                                        ? Column(
                                            children: [
                                              Container(
                                                height: decide_images.length > 0
                                                    ? 181.0
                                                    : 0.0,
                                                child: PageView.builder(
                                                  onPageChanged: (page) {
                                                    setState(() {
                                                      decideActiveIndicator =
                                                          page + 1;
                                                    });
                                                  },
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  controller:
                                                      carouselController,
                                                  itemCount:
                                                      decide_images.length > 0
                                                          ? decide_images.length
                                                          : 0,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 25.0,
                                                            right: 20.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(20.0),
                                                      ),
                                                      child: Image.network(
                                                        baseUrl +
                                                            decide_images[index]
                                                                ['response'],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: decide_images.length > 0
                                                    ? 26.0
                                                    : 0.0,
                                              ),
                                              Container(
                                                height: 8.0,
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount:
                                                      decide_images.length > 0
                                                          ? decide_images.length
                                                          : 0,
                                                  itemBuilder:
                                                      (context, index) => Row(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                4.0),
                                                          ),
                                                          color: decideActiveIndicator ==
                                                                  (index + 1)
                                                              ? bgSecondColor
                                                              : Color(
                                                                  0xFFD5D4D4),
                                                        ),
                                                        height: 6.0,
                                                        width:
                                                            decideActiveIndicator ==
                                                                    (index + 1)
                                                                ? 16.0
                                                                : 6.0,
                                                      ),
                                                      decide_images.length !=
                                                              (index + 1)
                                                          ? SizedBox(
                                                              width: 12.0,
                                                            )
                                                          : Container(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ],
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
            )
          ],
        ),
      ),
    );
  }
}
