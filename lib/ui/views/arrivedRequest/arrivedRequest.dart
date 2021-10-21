import 'package:flutter/material.dart';
import 'package:lambdastarter/core/controllers/appController.dart';
import 'package:lambdastarter/graphql/API/ds_request_filtered.graphql.dart';
import 'package:lambdastarter/graphql/API/ds_request_fixer.graphql.dart';
import 'package:lambdastarter/ui/common/arrived_request.widget.dart';
import 'package:lambdastarter/ui/common/bottombar_navigation.dart';
import 'package:lambdastarter/ui/common/custom_header.dart';
import 'package:lambdastarter/ui/common/paginate.dart';
import 'package:get/get.dart';
import 'package:lambdastarter/graphql/config.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';

class ArrivedRequestScreen extends StatefulWidget {
  const ArrivedRequestScreen({Key? key}) : super(key: key);

  @override
  _ArrivedRequestScreenState createState() => _ArrivedRequestScreenState();
}

class _ArrivedRequestScreenState extends State<ArrivedRequestScreen> {
  final AppController _appController = Get.put(AppController());
  bool loading = true;
  int currentPage = 1;
  int lastPage = 0;
  int total = 0;

  List<dynamic> requests = [];

  //1 Яаралтай
  //2 Хэвийн
  //4 Дунд зэрэг
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
        DsRequestFixerQuery(
          variables: DsRequestFixerArguments(
            fixer_id: _appController.user.value.id.toString(),
            page: page,
            size: 3,
          ),
        ),
      );
    } else {
      response = await client.execute(
        DsRequestFilteredQuery(
          variables: DsRequestFilteredArguments(
            fixer_id: _appController.user.value.id.toString(),
            type_id: selectedFilter.value.toString(),
            page: page,
            size: 3,
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
  void didChangeDependencies() {
    getData(1);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBottomBarHeader(context, 'Ирсэн хүсэлтүүд'),
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
                                setFilter(1);
                              },
                              child: Obx(
                                () => Container(
                                  height: 37,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: mainColor,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16.0),
                                    ),
                                    color:
                                        selectedFilter == 1 ? mainColor : null,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Яаралтай',
                                      style: TextStyle(
                                        color: selectedFilter == 1
                                            ? Colors.white
                                            : mainColor,
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
                                setFilter(2);
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
                                    color: selectedFilter == 2
                                        ? Color(0xFF5BA092)
                                        : null,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Хэвийн',
                                      style: TextStyle(
                                        color: selectedFilter == 2
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
                                      color: Color(0xFF65AAEA),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16.0),
                                    ),
                                    color: selectedFilter == 4
                                        ? Color(0xFF5DA3EA)
                                        : null,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Дунд зэрэг',
                                      style: TextStyle(
                                        color: selectedFilter == 4
                                            ? Colors.white
                                            : Color(0xFF5DA3EA),
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
                            return ArrivedRequest(
                              id: requests[index].id!,
                              title: requests[index].name.toString(),
                              description:
                                  requests[index].description.toString(),
                              time: requests[index].createdAt!,
                              typeId: requests[index].typeId,
                              onTap: () => Get.toNamed(
                                '/arrivedRequestDetail',
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
