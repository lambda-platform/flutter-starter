import 'package:flutter/material.dart';
import 'package:lambdastarter/ui/common/TopBar.dart';

class Setting extends StatefulWidget {
  const Setting({ Key? key }) : super(key: key);
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topBar(
        context: context,
        headerText: 'Тохиргоо',
        isBottomTabScreen: true,
        //   goBack: goBack,
        //  previusIndex: previusIndex,
    ), body:  SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            child: Container(
              color: Color(0xFFf5f6f7),
            ),
          ),
          PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Categories',
                ),
                Tab(
                  text: 'Brands',
                ),
                Tab(
                  text: 'Shops',
                )
              ], // list of tabs
            ),
          ),
          SizedBox(
            height: 10,
            child: Container(
              color: Color(0xFFf5f6f7),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
