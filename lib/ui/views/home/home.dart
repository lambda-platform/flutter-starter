import 'package:flutter/material.dart';
import 'package:lambdastarter/ui/common/header.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';
import 'package:lambdastarter/ui/views/map/map.dart';
import 'package:lambdastarter/ui/views/example/example.dart';
import 'package:lambdastarter/ui/common/menu.dart';
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
    Example(),
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
      return "Жишээ";
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
            label: "Жишээ",
          ),

        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
