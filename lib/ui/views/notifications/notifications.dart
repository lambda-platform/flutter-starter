import 'package:flutter/material.dart';
import 'package:ubengineering/ui/common/TopBar.dart';
import 'package:ubengineering/ui/styles/_colors.dart';

class Notifications extends StatefulWidget {

  const Notifications({Key? key, })
      : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> dipslayData = [
      {
        'date': '2021/03/23 09:53AM',
        'desc': 'Мэдэгдэл энд байна. Мэдэгдэл энд байна. ',
      },
      {
        'date': '2021/03/23 12:23AM',
        'desc': 'Мэдэгдэл энд байна. Мэдэгдэл энд байна. ',
      },
      {
        'date': '2021/03/23 15:43AM',
        'desc': 'Мэдэгдэл энд байна. Мэдэгдэл энд байна. ',
      },
    ];
    return Scaffold(
      appBar: topBar(
        context: context,
        headerText: 'Мэдэгдэл',
        isBottomTabScreen: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: SafeArea(
          child: Column(children: [
            Row(children: []),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dipslayData.length,
                  itemBuilder: (BuildContext context, int index) {
                    Container status;
                    switch (dipslayData[index]['status']) {
                      case 1:
                        status = Container();
                        break;
                      case 2:
                        status = Container();
                        break;
                      case 3:
                        status = Container();
                        break;
                      default:
                        status = Container();
                    }
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            border: Border.all(
                              color: grey,
                            ),
                          ),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.notifications,
                                        size: 18.0,
                                        color: mainColor,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        dipslayData[index]['date'].toString(),
                                        style: TextStyle(
                                          color: darkGrey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      dipslayData[index]['desc'].toString(),
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: darkGrey,
                                        height: 1.5,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}