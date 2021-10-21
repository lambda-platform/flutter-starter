import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lambdastarter/core/controllers/appController.dart';
import 'package:lambdastarter/ui/common/custom_header.dart';
import 'package:lambdastarter/ui/common/paginate.dart';
import 'package:lambdastarter/ui/common/send_request.widget.dart';
import 'package:lambdastarter/graphql/config.dart';
import 'package:lambdastarter/graphql/API/ds_request_conflicts.dart';

class SendRequestScreen extends StatefulWidget {
  const SendRequestScreen({Key? key}) : super(key: key);

  @override
  _SendRequestScreenState createState() => _SendRequestScreenState();
}

class _SendRequestScreenState extends State<SendRequestScreen> {
  final AppController _appController = Get.put(AppController());
  bool loading = true;
  int currentPage = 1;
  int lastPage = 0;
  int total = 0;

  List<DsRequestConflicts$Query$Paginate$DsRequestConflicts> requests = [];

  void getData(int page) async {
    setState(() {
      loading = true;
    });
    final response = await client.execute(
      DsRequestConflictsQuery(
        variables: DsRequestConflictsArguments(
          requested_user_id: _appController.user.value.id.toString(),
          page: page,
          size: 3,
        ),
      ),
    );
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
      appBar: CustomHeader(context, 'Илгээсэн хүсэлтүүд'),
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
              : Pagination(
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
                      return SendRequestWidget(
                        id: requests[index].id!,
                        title: requests[index].name.toString(),
                        description: requests[index].description.toString(),
                        time: requests[index].createdAt!,
                        statusId: requests[index].statusId,
                        organization: requests[index].nameOrg.toString(),
                        onTap: () => Get.toNamed(
                          '/sendRequestDetail',
                          arguments: requests[index].id,
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
