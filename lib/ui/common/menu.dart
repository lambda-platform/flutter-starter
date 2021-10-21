import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';
import 'package:lambdastarter/core/controllers/appController.dart';
import 'package:get/get.dart';


import 'package:lambda/modules/agent/agent_controller.dart';
import 'package:lambdastarter/ui/common/logoutModal.dart';
import 'package:lambdastarter/ui/common/customIcons.dart';
import 'package:lambdastarter/ui/views/setting/setting.dart';

class MenuWidget extends StatefulWidget {
  final GlobalKey<SliderMenuContainerState> _menuKey;
  const MenuWidget(this._menuKey, {Key? key,}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final AppController _appController = Get.put(AppController());
  final AgentController _agentController = Get.put(AgentController());

  Future<void> logout() async{
    await _agentController.logout();

    Get.offAllNamed("/login");
  }
  void goToHome(){
    Get.offAllNamed('/home');
  }
  void goToChart(){
    widget._menuKey.currentState!.closeDrawer();
    Get.toNamed('/chart');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 51,
            backgroundColor: imgColor,
            child: CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            _appController.user.value.firstName ?? "",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'BalsamiqSans'),
          ),
          SizedBox(
            height: 13,
          ),
          CircleAvatar(
            radius: 36,
            backgroundColor: Color(
              0xFFFF8585,
            ),
            child: CircleAvatar(
              radius: 33,
              backgroundImage: AssetImage('assets/images/userReg.png'),
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
            height: 13,
          ),
          InkWell(
            onTap: () {
            
            },
            child: CircleAvatar(
              radius: 36,
              backgroundColor: Color.fromRGBO(50, 52, 64, 0.4),
              child: CircleAvatar(
                radius: 33,
                backgroundImage: AssetImage('assets/images/setting.png'),
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
            height: 13,
          ),
          InkWell(
            onTap: () {

            },
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Color.fromRGBO(50, 52, 64, 0.4),
              child: Center(
                child: Row(
                 // crossAxisAlignment: CrossAxisAlignment.center,
                //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                     radius: 32,
                      backgroundImage: AssetImage('assets/images/request.png'),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            'Илгээсэн хүсэлтүүд',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 13,
          ),
          InkWell(
            onTap: () {
              logoutModal(context);
            },
            child: CircleAvatar(
              radius: 36,
              backgroundColor: Color.fromRGBO(50, 52, 64, 0.4),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/exit.png'),
               radius: 33,
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
          SizedBox(
            height: 13,
          ),
         // sliderItem('Нүүр', Icons.home, goToHome),
         // sliderItem('Гарах', Icons.arrow_back_ios, logout)
          //sliderItem('Lambda Chart', Icons.pie_chart, goToChart),
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