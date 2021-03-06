import 'package:flutter/material.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';
import 'package:lambdastarter/core/controllers/appController.dart';
import 'package:get/get.dart';
import 'package:lambdastarter/ui/views/home/home.dart';
import 'package:lambdastarter/ui/views/authentication/login.dart';
import 'package:lambda/modules/agent/agent_controller.dart';
import 'package:lambdastarter/ui/fonts/esri_icons.dart';
class MenuWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> _menuKey;
  const MenuWidget(this._menuKey, {Key? key,}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final AppController _appController = Get.put(AppController());
  final AgentController _agentController = Get.put(AgentController());

  Future<void> logout() async{
    await _agentController.logout();
    Get.offAll(() => LoginPage());
  }
  void goToPage(int index){
    Get.offAll(() => HomePage(pageIndex: index));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 65,
            backgroundColor: mainColor,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/user_profile.png'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _appController.user.value.firstName ?? "",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'BalsamiqSans'),
          ),
          SizedBox(
            height: 20,
          ),
          sliderItem('Газрын зураг', EsriIcons.maps, ()=>goToPage(0)),
          sliderItem('Chart', EsriIcons.chart, ()=>goToPage(1)),
          sliderItem('Grid, From', EsriIcons.table, ()=>goToPage(2)),
          sliderItem('Гарах', Icons.arrow_back_ios, logout)
        ],
      ),
    );
  }

  Widget sliderItem(String title, IconData icons, VoidCallback onTap) => ListTile(
      title: Text(
        title,
      ),
      leading: Icon(
        icons,
        color: Colors.black,
      ),
      onTap: () {
        onTap();
      });
}