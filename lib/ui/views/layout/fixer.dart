import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lambda/modules/agent/agent_controller.dart';
import 'package:lambdastarter/core/constants/controllers.dart';
import 'package:lambdastarter/core/controllers/appController.dart';
import 'package:lambdastarter/ui/common/header.dart';
import 'package:lambdastarter/ui/helpers/logout_modal.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';
import 'package:lambdastarter/ui/views/ArrivedRequest/arrivedRequest.dart';
import 'package:lambdastarter/ui/views/map/map.dart';
import 'package:lambdastarter/ui/views/qr/qr.dart';
import 'package:lambdastarter/ui/views/userRequest/userRequest.dart';
import 'package:lambdastarter/ui/views/notifications/notifications.dart';
import 'package:lambdastarter/ui/common/menu.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class FixerLayout extends StatefulWidget {
  const FixerLayout({Key? key}) : super(key: key);

  @override
  _AdminLayoutState createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<FixerLayout> {
  var index = Get.arguments;
  int _selectedIndex = 0;
  final AppController _appController = Get.put(AppController());
  final AgentController _agentController = Get.put(AgentController());

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  List<Widget> _pages = <Widget>[];

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => QR()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Future<void> logout() async {
    await _agentController.logout();
    Navigator.pop(context);
    Get.offNamed('/login');
  }

  @override
  void initState() {
    _pages.addAll([
      Map(_openEndDrawer),
      QR(),
      ArrivedRequestScreen(),
      Notifications(),
    ]);
    _selectedIndex = index ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 0,
        brightness: Brightness.light,
        elevation: 0,
      ),
      key: _scaffoldKey,
      body: IndexedStack(
        children: _pages,
        index: _selectedIndex,
      ),
      endDrawer: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        child: Drawer(
          child: Container(
            color: mainColor,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: bgSecondColor,
                          radius: 50,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 45,
                            backgroundImage: AssetImage(
                              'assets/images/profile.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Icon(
                            Icons.chevron_right,
                            color: mainColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      _appController.user.value.firstName ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: -0.5,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed('/profile'),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: Color(
                          0xFFFF8585,
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      'Бүртгэл',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 43,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed('/settings'),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: Color.fromRGBO(50, 52, 64, 0.4),
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      'Тохиргоо',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 43,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/repairHistory');
                      },
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: Color.fromRGBO(50, 52, 64, 0.4),
                        child: Center(
                          child: Icon(
                            Icons.mail,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      'Засвар хийсэн түүх',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 43,
                    ),
                    GestureDetector(
                      onTap: () {
                        alertModal(context,
                            'Та системээс гарахдаа итгэлтэй байна уу?', logout);
                      },
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: Color.fromRGBO(50, 52, 64, 0.4),
                        child: Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      'Гарах',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            unselectedItemColor: grayColor,
            selectedItemColor: mainColor,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Нүүр",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code),
                label: 'QR код',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.schedule_send_outlined),
                label: 'Ирсэн хүсэлт',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Мэдэгдэл',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
