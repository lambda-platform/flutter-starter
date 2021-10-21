import 'package:get/get.dart';
import 'package:lambdastarter/ui/views/arrivedRequest/aboutRepair.dart';
import 'package:lambdastarter/ui/views/arrivedRequest/arrivedRequest.dart';
import 'package:lambdastarter/ui/views/arrivedRequest/arrivedRequestDetail.dart';
import 'package:lambdastarter/ui/views/attribute/attribute.dart';
import 'package:lambdastarter/ui/views/enrichment/addEnrichment.dart';
import 'package:lambdastarter/ui/views/init.dart';
import 'package:lambdastarter/ui/views/authentication/login.dart';
import 'package:lambdastarter/ui/views/chart/chart.dart';
import 'package:lambdastarter/ui/views/introduction/introduction.dart';
import 'package:lambdastarter/ui/views/layout/fixer.dart';
import 'package:lambdastarter/ui/views/layout/citizen.dart';
import 'package:lambdastarter/ui/views/layout/enricher.dart';
import 'package:lambdastarter/ui/views/notifications/notificationDetail.dart';
import 'package:lambdastarter/ui/views/profile/profile.dart';
import 'package:lambdastarter/ui/views/qr/qr.dart';
import 'package:lambdastarter/ui/views/repairHistory/repairHistory.dart';
import 'package:lambdastarter/ui/views/repairHistory/repairHistoryDetail.dart';
import 'package:lambdastarter/ui/views/sendRequest/sendRequest.dart';
import 'package:lambdastarter/ui/views/sendRequest/sendRequestDetail.dart';
import 'package:lambdastarter/ui/views/setting/setting.dart';
import 'package:lambdastarter/ui/views/userRequest/userRequest.dart';

class AppRouter {
  AppRouter._();

  static final routes = <GetPage>[
    GetPage(name: '/', page: () => InitScreen()),
    GetPage(name: '/citizen', page: () => CititzenLayout()),
    GetPage(name: '/fixer', page: () => FixerLayout()),
    GetPage(name: '/enricher', page: () => EnricherLayout()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/chart', page: () => ChartExample()),
    GetPage(name: '/profile', page: () => ProfileScreen()),
    GetPage(name: '/introduction', page: () => IntroductionScreen()),
    GetPage(name: '/sendRequest', page: () => SendRequestScreen()),
    GetPage(name: '/sendRequestDetail', page: () => SendRequestDetailScreen()),
    GetPage(name: '/repairHistory', page: () => RepairHistoryScreen()),
    GetPage(name: '/repairHistoryDetail', page: () => RepairHistoryDetailScreen()),
    GetPage(name: '/attribute', page: () => Attribute()),
    GetPage(name: '/qr', page: () => QR()),
    GetPage(name: '/arrivedRequests', page: () => ArrivedRequestScreen()),
    GetPage(name: '/arrivedRequestDetail', page: () => ArrivedRequestDetailScreen()),
    GetPage(name: '/aboutRepair', page: () => AboutRepairScreen()),
    GetPage(name: '/userRequest', page: () => UserRequest()),
    GetPage(name: '/settings', page: () => Setting()),
    GetPage(name: '/addEnrichment', page: () => AddEnrichmentScreen()),
    GetPage(name: '/notificationDetail', page: () => NotificationDetailScreen()),
  ];
}
