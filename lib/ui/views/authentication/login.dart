import 'dart:convert';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubengineering/ui/styles/_colors.dart';
import 'package:lambda/modules/agent/agent_controller.dart';
import 'package:ubengineering/core/controllers/appController.dart';
import 'package:ubengineering/ui/common/map_widgets/esri_icons_icons.dart';
import 'package:ubengineering/core/models/user.dart';
import 'package:ubengineering/ui/views/home/home.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  final AgentController _agentController = Get.put(AgentController());
  final AppController _appController = Get.put(AppController());

  // Notify fcm = new Notify();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  TextEditingController login = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  void initState() {
    super.initState();
    
  }

  fbLogin(BuildContext context) async {
//    bool isAuth = await social.fbLogin(context, '/vpf/api/social/login');
//    if (isAuth) {
//      prefs = await SharedPreferences.getInstance();
//      final userState = Provider.of<UserModel>(context);
//      String userData = prefs.getString('user');
//      User user = new User.fromJson(jsonDecode(userData));
//      await fcm.setToken("/vpf/api/token", user.id);
//      userState.setUser(user);
//      Navigator.pushReplacementNamed(context, '/main');
//    }
  }

  googleLogin(BuildContext context) async {
//    bool isAuth = await social.googleLogin(context);
//    if (isAuth) {
//      prefs = await SharedPreferences.getInstance();
//      final userState = Provider.of<UserModel>(context);
//      String userData = prefs.getString('user');
//      User user = new User.fromJson(jsonDecode(userData));
//      userState.setUser(user);
//      Navigator.pushReplacementNamed(context, '/main');
//    }
  }

  

  bioLogin() async {

    await _agentController.bioLogin(context);

    setState(() {
      password.text = _agentController.password.value;
    });
    this.doLogin();
  }

  doLogin() async {
    bool isAuth = await _agentController.doLogin(context, '/auth/login', login.text, password.text, loginByUsername: true);

    if (isAuth) {

        User user = new User.fromJson(jsonDecode(_agentController.userData.value));
        _appController.setUser(user);
        Get.offAll(() => HomePage());

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/ub2.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
                child: Container(
//                  decoration: BoxDecoration(
//                    color: Color.fromRGBO(23, 61, 156, 0.6),
//                  ),
                )
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.8,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.asset(
                      'assets/images/ub_logo.png',
                      height: 80,
                      fit:BoxFit.cover
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                   Container(
                       width: 260,
                       child: Text('UB \n ENGINEERING', textAlign: TextAlign.center, style: TextStyle(color: mainColor, fontSize: 16, fontWeight: FontWeight.w900),)
                   ),
                ],
              ),
            ),
            ListView(
              padding: EdgeInsets.only(top: 0, bottom: 0),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.7,
//                      left: 25,
//                      right: 25,
                      bottom: 20),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(30),
//                    boxShadow: [
//                      BoxShadow(
//                        color: Color(0x16222222),
//                        blurRadius: 15.0,
//                        spreadRadius: .7,
//                        offset: Offset(3.0, 3.0),
//                      )
//                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 15, left: 25, right: 25),
                        child: Form(
                          key: _loginFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              SizedBox(
                                height: 14.0,
                              ),
                              Container(
                                height: 40,
                                child: TextFormField(
                                  controller: login,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(2),
                                    border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(20)),
                                    labelText: 'Нэврэх нэр',
                                 //   labelStyle: TextStyle(color:primaryColor),
                                    hintStyle: TextStyle(color: Color.fromRGBO(147, 157, 186, .78), fontSize: 18, fontWeight: FontWeight.w400),
                                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(width: 1)),
                                    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(width: 1, color: Colors.red)),
                                    errorStyle: TextStyle(height: 0),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        EsriIcons.user,
                                        color:Color.fromRGBO(147, 157, 186, .78),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  validator: (val) {
                                    return val == null ? '' : null;
                                  },
                                  onSaved: (val) => login.text = val != null ? val : "",
                                ),
                              ),
                              SizedBox(
                                height: 14.0,
                              ),
                              Container(
                                height: 40,
                                child: TextFormField(
                                  controller: password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(2),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelText: 'Нууц үг',
                                  //  labelStyle: TextStyle(color:primaryColor),

                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(147, 157, 186, .78),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(width: 1)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.red)),
                                    errorStyle: TextStyle(height: 0),
                                    prefixIcon: Icon(
                                      EsriIcons.locked,
                                      color: Color.fromRGBO(147, 157, 186, .78),
                                      size: 22,
                                    ),
                                  ),
                                  onSaved: (val) => password.text = val != null ? val : "",
                                  validator: (val) {
                                    return val == null ? '' : null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 28,
                                child: Row(
                                  children: <Widget>[
                                    Switch(
                                      value: _agentController.isRemember.value,
                                      onChanged: (value) {
                                        _agentController.handleRemember(value);
                                      },
                                      activeTrackColor: Color(0xFF1E88E5),
                                      activeColor: Color(0xFF0D47A1),
                                    ),
                                    Text(
                                      'Нэвтрэх нэр хадгалах',
                                      style: TextStyle(
                                        color: Color(0xff444444),
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              _agentController.hasBio == true
                                  ? Container(
                                      alignment: Alignment.center,
                                      height: 28,
                                      child: Row(
                                        children: <Widget>[
                                          Switch(
                                            value: _agentController.isBioRemember.value,
                                            onChanged: (value) {
                                              _agentController.handleBioRemember(value);
                                            },
                                            activeTrackColor: Color(0xFF1E88E5),
                                            activeColor: Color(0xFF0D47A1),
                                          ),
                                          Text(
                                            _agentController.bioType.value == 'face'
                                                ? 'Цаашид Face ID-р нэвтрэх'
                                                : 'Цаашид хурууны хээгээр нэвтрэх',
                                            style: TextStyle(
                                                color: Color(0xff444444),
                                                fontSize: 13),
                                          )
                                        ],
                                      ),
                                    )
                                  : SizedBox(height: 0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 40,
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius:
                                            new BorderRadius.circular(50.0),
                                      ),
                                      child: FlatButton(
                                        child: Container(
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                  'Нэвтрэх'.toUpperCase(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onPressed: () {
                                         final form =
                                             this._loginFormKey.currentState;
                                         if (form!.validate()) {
                                           form.save();
                                           this.doLogin();
                                         }
//                                           Navigator.pushNamed(context, '/main');
                                        },

                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.fingerprint,
                                        color: _agentController.isBioRemember.value && _agentController.password.value != "" && _agentController.password.value != null ? Color(0xFF0D47A1) : Color(0xff999999),
                                        size: 44,
                                      ),
                                      onPressed: () => bioLogin()),
                                  SizedBox(
                                    width: 6,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 30, right: 0),
                              height: 22,
                              child: FlatButton(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Wrap(
                                    children: <Widget>[
                                      Text(
                                        'Нууц үгээ мартсан?',
                                        style: TextStyle(
                                            color: Color(0xff2f55a4),
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/recovery');
                                  }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Нийслэлийн захирагчийн алба © 2021',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 13,
                            decoration: TextDecoration.none,
                            color: primaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
