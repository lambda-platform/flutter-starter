import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lambdastarter/core/controllers/appController.dart';
import 'package:lambdastarter/graphql/API/repair_history_filtered.graphql.dart';
import 'package:lambdastarter/graphql/API/request_repair_history.graphql.dart';
import 'package:lambdastarter/graphql/config.dart';
import 'package:lambdastarter/ui/common/custom_header.dart';
import 'package:lambdastarter/ui/common/paginate.dart';
import 'package:lambdastarter/ui/common/repair_history.widget.dart';
import 'package:intl/intl.dart';

class RepairHistoryScreen extends StatefulWidget {
  const RepairHistoryScreen({Key? key}) : super(key: key);

  @override
  _RepairHistoryScreenState createState() => _RepairHistoryScreenState();
}

class _RepairHistoryScreenState extends State<RepairHistoryScreen> {
  final AppController _appController = Get.put(AppController());
  bool loading = true;
  int currentPage = 1;
  int lastPage = 0;
  int total = 0;

  List<dynamic> requests = [];

  var selectedFilter = 0.obs;

  void setFilter(int status) {
    if (selectedFilter.value == status) {
      selectedFilter.value = 0;
    } else {
      selectedFilter.value = status;
    }
    getData(1);
  }

  void getData(int page) async {
    setState(() {
      loading = true;
    });
    final response;
    if (selectedFilter.value == 0) {
      response = await client.execute(
        RequestRepairHistoryQuery(
          variables: RequestRepairHistoryArguments(
            fixer_id: _appController.user.value.id.toString(),
            page: page,
            size: 1,
          ),
        ),
      );
    } else {
      response = await client.execute(
        RepairHistoryFilteredQuery(
          variables: RepairHistoryFilteredArguments(
            fixer_id: _appController.user.value.id.toString(),
            status_id: selectedFilter.value.toString(),
            page: page,
            size: 1,
          ),
        ),
      );
    }
    setState(() {
      requests = response.data!.paginate.dsRequestConflicts!;
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
      appBar: CustomHeader(context, 'Засвар хийсэн түүх'),
      body: SafeArea(
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
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setFilter(3);
                              },
                              child: Obx(
                                () => Container(
                                  height: 37,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF5BA092),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16.0),
                                    ),
                                    color: selectedFilter.value == 3
                                        ? Color(0xFF5BA092)
                                        : null,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Шийдэгдсэн',
                                      style: TextStyle(
                                        color: selectedFilter.value == 3
                                            ? Colors.white
                                            : Color(0xFF5BA092),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6.0,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setFilter(4);
                              },
                              child: Obx(
                                () => Container(
                                  height: 37,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.red,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16.0),
                                    ),
                                    color: selectedFilter.value == 4
                                        ? Colors.red
                                        : null,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Буцаагдсан',
                                      style: TextStyle(
                                        color: selectedFilter.value == 4
                                            ? Colors.white
                                            : Colors.red,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: Pagination(
                        currentPage,
                        lastPage,
                        total,
                        loading,
                        getData,
                        ListView.builder(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          physics: BouncingScrollPhysics(),
                          itemCount: requests == null ? 0 : requests.length,
                          itemBuilder: (BuildContext context, int index) {
                            List<dynamic> images = [];
                            if (requests[index].fixerImage != "") {
                              String stringList =
                                  requests[index].fixerImage.toString();
                              images = jsonDecode(stringList);
                            }
                            String endedDate;
                            if (requests[index].endedAt == null) {
                              endedDate = DateFormat('yyyy/MM/d hh:mm aaa')
                                  .format(DateTime.now());
                            } else {
                              endedDate = DateFormat('yyyy/MM/d hh:mm aaa')
                                  .format(requests[index].endedAt!);
                            }
                            return RepairHistoryWidget(
                              images: images,
                              description: requests[index].fixerDescription!,
                              endedDate: endedDate,
                              name: requests[index].name!,
                              statusId: requests[index].statusId!,
                              onTap: () => Get.toNamed(
                                '/repairHistoryDetail',
                                arguments: requests[index].id,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
