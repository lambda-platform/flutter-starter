import 'package:get/get.dart';
import 'package:ubengineering/ui/views/arrivedRequest/aboutRepair.dart';
import 'package:ubengineering/ui/views/arrivedRequest/arrivedRequest.dart';
import 'package:ubengineering/ui/views/arrivedRequest/arrivedRequestDetail.dart';
import 'package:ubengineering/ui/views/attribute/attribute.dart';
import 'package:ubengineering/ui/views/enrichment/addEnrichment.dart';
import 'package:ubengineering/ui/views/init.dart';
import 'package:ubengineering/ui/views/authentication/login.dart';
import 'package:ubengineering/ui/views/chart/chart.dart';
import 'package:ubengineering/ui/views/introduction/introduction.dart';
import 'package:ubengineering/ui/views/layout/fixer.dart';
import 'package:ubengineering/ui/views/layout/citizen.dart';
import 'package:ubengineering/ui/views/layout/enricher.dart';
import 'package:ubengineering/ui/views/notifications/notificationDetail.dart';
import 'package:ubengineering/ui/views/profile/profile.dart';
import 'package:ubengineering/ui/views/qr/qr.dart';
import 'package:ubengineering/ui/views/repairHistory/repairHistory.dart';
import 'package:ubengineering/ui/views/repairHistory/repairHistoryDetail.dart';
import 'package:ubengineering/ui/views/sendRequest/sendRequest.dart';
import 'package:ubengineering/ui/views/sendRequest/sendRequestDetail.dart';
import 'package:ubengineering/ui/views/setting/setting.dart';
import 'package:ubengineering/ui/views/userRequest/userRequest.dart';

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
