import 'package:flutter/material.dart';
import 'package:lambdastarter/ui/common/header.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';
import 'package:lambdastarter/ui/views/map/map.dart';

import 'package:lambdastarter/ui/fonts/esri_icons.dart';
import 'package:lambdastarter/ui/common/menu.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lambdastarter/core/models/page.dart';
import 'package:lambdastarter/ui/views/chart/chart.dart';
import 'package:lambdastarter/ui/views/crud/Grid.dart';

class HomePage extends StatefulWidget {
  final int? pageIndex;

  const HomePage({Key? key, this.pageIndex = 0}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<SliderMenuContainerState> _menuKey = new GlobalKey<SliderMenuContainerState>();
  List<LambdaPage> pages = [
    LambdaPage("Газрын зураг", Icon(EsriIcons.maps), EsriIcons.maps, Map()),
    LambdaPage("Chart", Icon(EsriIcons.chart), EsriIcons.chart, ChartExample()),
    LambdaPage("Grid, From", Icon(EsriIcons.table), EsriIcons.chart, GridPage()),
  ];
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.pageIndex! >= 0) {
      setState(() {
        _pageIndex = widget.pageIndex!;
      });
    }
  }

  void changePage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  Widget bottomNav() {
    List<BottomNavigationBarItem> Navs = [];
    for (LambdaPage page in pages) {
      Navs.add(BottomNavigationBarItem(
        icon: page.icon,
        label: page.title,
      ));
    }
    return BottomNavigationBar(
      items: Navs,
      currentIndex: _pageIndex,
      selectedItemColor: primaryColor,
      onTap: changePage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Header(
          pages[_pageIndex].title,
          _scaffoldKey,
          _menuKey,
        ),
      ),
      body: SliderMenuContainer(
        appBarColor: Colors.white,
        key: _menuKey,
        sliderMenuOpenSize: 200,
        hasAppBar: false,
        sliderMenu: MenuWidget(_menuKey),
        sliderMain: pages[_pageIndex].page,
      ),
      bottomNavigationBar: bottomNav(),
    );
  }
}
