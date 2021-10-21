import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lambda/plugins/data_form/loader.dart';
import 'package:lambdastarter/graphql/API/ds_notificaiton_detail.graphql.dart';
import 'package:lambdastarter/graphql/config.dart';
import 'package:lambdastarter/graphql/utils/coercers.dart';
import 'package:lambdastarter/ui/common/api_error.dart';
import 'package:lambdastarter/ui/common/custom_header.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';

class NotificationDetailScreen extends StatefulWidget {
  NotificationDetailScreen({Key? key}) : super(key: key);

  @override
  _NotificationDetailScreenState createState() =>
      _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  var notId = Get.arguments;

  Future<dynamic> _getData() async {
    final response = await client.execute(
      DsNotificationDetailQuery(
        variables: DsNotificationDetailArguments(not_id: notId.toString()),
      ),
    );
    return response.data!.dsNotifcation;
  }

  late Future<dynamic> _func;

  @override
  void initState() {
    _func = _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(context, 'Мэдэгдэл'),
      body: SafeArea(
          child: FutureBuilder<dynamic>(
        future: _func,
        builder: (context, snapshot) {
          Widget children;
          if (snapshot.hasData) {
            children = Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 15.0,
                    ),
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 10.0,
                      right: 10.0,
                      bottom: 20.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                      border: Border.all(
                        width: 1.0,
                        color: snapshot.data[0].seen == 1 ? grey : mainColor,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    color: snapshot.data[0].seen == 1
                                        ? grey
                                        : mainColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      snapshot.data[0].title.toString(),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: textDarkGrey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              DateFormat('yyyy/MM/d hh:mm aaa')
                                  .format(snapshot.data[0].createdAt),
                              style: TextStyle(
                                fontSize: 14.0,
                                color: textDarkGrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 13.0,
                        ),
                        Text(
                          snapshot.data[0].body.toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: textDarkGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
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
      )),
    );
  }
}
