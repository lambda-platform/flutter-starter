import 'package:flutter/material.dart';
import 'package:ubengineering/ui/common/header.dart';
import 'package:ubengineering/ui/styles/_colors.dart';
import 'package:ubengineering/ui/views/map/map.dart';
import 'package:ubengineering/ui/views/qr/qr.dart';
import 'package:ubengineering/ui/views/userRequest/userRequest.dart';
import 'package:ubengineering/ui/views/notifications/notifications.dart';
import 'package:ubengineering/ui/common/menu.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<SliderMenuContainerState> _menuKey =
  new GlobalKey<SliderMenuContainerState>();
  static const List<Widget> _pages = <Widget>[
    Map(),
    QR(),
    UserRequest(),
    Notifications(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String pageTitle(int index){
    switch (index){
      case 0:
      return "Нүүр";
        break;
      case 1:
      return "QR код";
        break;
      case 2:
      return "Хүсэлт";
        break;
      case 3:
      return "Мэдэгдэл";
        break;
    }
    return "Нүүр";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child:Header(
          pageTitle(_selectedIndex),
           _scaffoldKey,
          _menuKey,
        ),
      ),
      body: SliderMenuContainer(
          appBarColor: Colors.white,
          key: _menuKey,
          sliderMenuOpenSize: 200,
          hasAppBar:false,
          sliderMenu: MenuWidget(_menuKey),
          sliderMain: IndexedStack(
            children: _pages,
            index: _selectedIndex,
          )),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: grayColor,
        selectedItemColor: mainColor,
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
            label: 'Хүсэлт',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Мэдэгдэл',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
