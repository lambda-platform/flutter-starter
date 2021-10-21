import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubengineering/core/controllers/appController.dart';
import 'package:ubengineering/graphql/API/ds_notifications.graphql.dart';
import 'package:ubengineering/graphql/config.dart';
import 'package:ubengineering/ui/common/TopBar.dart';
import 'package:ubengineering/ui/common/bottombar_navigation.dart';
import 'package:ubengineering/ui/common/custom_header.dart';
import 'package:ubengineering/ui/common/paginate.dart';
import 'package:ubengineering/ui/styles/_colors.dart';
import 'package:intl/intl.dart';

class Notifications extends StatefulWidget {
  const Notifications({
    Key? key,
  }) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final AppController _appController = Get.put(AppController());
  bool loading = true;
  int currentPage = 1;
  int lastPage = 0;
  int total = 0;

  List<DsNotifications$Query$Paginate$DsNotifcation> notifications = [];

  void getData(int page) async {
    setState(() {
      loading = true;
    });
    final response = await client.execute(
      DsNotificationsQuery(
        variables: DsNotificationsArguments(
          userId: _appController.user.value.id.toString(),
          page: page,
          size: 3,
        ),
      ),
    );
    setState(() {
      notifications = response.data!.paginate.dsNotifcation!;
      currentPage = page;
      lastPage = response.data!.paginate.lastPage;
      total = response.data!.paginate.total;
      loading = false;
    });
  }

  @override
  void initState() {
    getData(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBottomBarHeader(context, 'Мэдэгдэл'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            child: loading
                ? Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Pagination(
                    currentPage,
                    lastPage,
                    total,
                    loading,
                    getData,
                    ListView.builder(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      physics: BouncingScrollPhysics(),
                      itemCount:
                          notifications == null ? 0 : notifications.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed('/notificationDetail',
                                arguments: notifications[index].notifId);
                          },
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
                                color: notifications[index].seen == 1
                                    ? grey
                                    : mainColor,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.notifications,
                                            color:
                                                notifications[index].seen == 1
                                                    ? grey
                                                    : mainColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              notifications[index]
                                                  .title
                                                  .toString(),
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
                                      DateFormat('yyyy/MM/d hh:mm aaa').format(
                                          notifications[index].createdAt!),
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
                                  notifications[index].body.toString(),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: textDarkGrey,
                                  ),
                                  maxLines: 3,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
