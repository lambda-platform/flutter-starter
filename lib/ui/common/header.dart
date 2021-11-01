import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda/modules/agent/agent_controller.dart';
import 'package:lambdastarter/core/controllers/appController.dart';
import 'package:get/get.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';

import 'package:shared_preferences/shared_preferences.dart';
class Header extends StatefulWidget {
  final String title;

  final GlobalKey<ScaffoldState> scaffold;

  const Header(
      this.title,
      this.scaffold,
      {Key? key,})
      : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  SharedPreferences? _prefs;

  final AgentController _agentController = Get.put(AgentController());
  final AppController _appController = Get.put(AppController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }




  Widget userAction() {


    return Row(children: <Widget>[
      InkWell(
        child: Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.only(right: 10, top: 0, left: 10),
          height: 27,
          decoration: BoxDecoration(
              border: Border.all(
                  color: primaryColor,
                  width: 1.2),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                CupertinoIcons.profile_circled,
                color: primaryColor,
                size: 16,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                _appController.user.value.firstName ?? "",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        onTap: () => Get.toNamed('/profile'),
      ),

    ]);
  }

  Widget defaultAction() {
    return Row(
      children: <Widget>[
        InkWell(
          child: Container(
            margin: EdgeInsets.only(right: 3),
            padding: EdgeInsets.only(right: 10, top: 0, left: 10),
            height: 26,
            decoration: BoxDecoration(
                border: Border.all(
                    color: primaryColor,
                    width: 1.7),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  CupertinoIcons.profile_circled,
                  color: primaryColor,
                  size: 16,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Нэвтрэх".toUpperCase(),
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          onTap: () => Navigator.pushNamed(context, '/login'),
        ),
        InkWell(
          child: Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.only(left: 8),
            width: 30,
            height: 40,
            child: Icon(
              CupertinoIcons.info,
              color: primaryColor,
              size: 33,
            ),
          ),
          onTap: () => Navigator.pushNamed(context, '/about'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.all(0),
        icon: Container(
          height: 40,
          padding: EdgeInsets.only(left: 15, right: 10, top: 3),
          child: Icon(
            Icons.menu,
            color:  primaryColor,
            size: 26,
          ),
        ),
        onPressed: () {
          widget.scaffold.currentState!.openDrawer();
        },
      ),
      actions: <Widget>[
        _agentController.isAuth.value
            ?  userAction()
            :  defaultAction()
      ],
      centerTitle: false,
      titleSpacing: 0,
      title: Container(
        padding: EdgeInsets.only(top: 2),
        child: Row(
          children: <Widget>[
            Text(
              widget.title.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                  fontSize: 14),
            ),
          ],
        ),
      ),

    );
  }
}
