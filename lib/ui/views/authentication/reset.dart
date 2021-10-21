import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubengineering/core/viewmodels/user_model.dart';
import 'package:ubengineering/ui/views/verify.dart';
import 'package:lambda/modules/network_util.dart';


import 'package:lambda/plugins/progress_dialog/progress_dialog.dart';

class ResetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  bool loading = false;
  String code = '';
  String password = '';
  String passwordConfirm = '';
  NetworkUtil _netUtil = new NetworkUtil();

  @override
  void initState() {
    super.initState();
  }

  doReset(BuildContext context) async {
    ProgressDialog pr = new ProgressDialog(context, ProgressDialogType.Normal);
    FocusScope.of(context).requestFocus(new FocusNode());
    await Future.delayed(Duration(milliseconds: 500));

    pr.setMessage('Түр хүлээнэ үү...');
    pr.show();

    final state = Provider.of<UserModel>(context, listen: false);
    User user = state.getUser;

    ResponseModel response = await _netUtil.post(
        '/auth/password-reset', {"password": password, "password_confirm":passwordConfirm, "code":code, 'email': user.email});

    if (response.status) {
      //User user = new User.fromJson(response.data);
     // final state = Provider.of<UserModel>(context);
     // state.setUser(user);

      pr.update(message: response.msg, type: 'success');
      await new Future.delayed(const Duration(seconds: 1));
      pr.hide();

      Navigator.pushReplacementNamed(context, '/main');
    } else {
      pr.update(message: response.msg, type: 'error');
      await new Future.delayed(const Duration(milliseconds: 1500));
      pr.hide();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFfffff),
      body: Stack(
        children: <Widget>[
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/images/register.png',
                      height: 150,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 50, left: 35, right: 35, bottom: 30),
                    child: Form(
                      key: _registerFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            initialValue: code,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
//
                              contentPadding: EdgeInsets.all(2),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(25)),
                              labelText: 'Нууц үгээ сэргээх код',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(147, 157, 186, .78),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(width: 1)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.red)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromRGBO(147, 157, 186, .78),
                                size: 22,
                              ),
                            ),
                            onSaved: (val) => code = val,
                            validator: (val) {
                              return val.isEmpty
                                  ? 'Нууц үгээ сэргээх код оруулна уу!'
                                  : null;
                            },
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            initialValue: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(25)),
                              labelText: 'Шинэ нууц үг',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(147, 157, 186, .78),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(width: 1)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.red)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromRGBO(147, 157, 186, .78),
                                size: 22,
                              ),
                            ),
                            onSaved: (val) => password = val,
                            validator: (val) {
                              return val.isEmpty
                                  ? 'Нууц үгээ оруулна уу!'
                                  : null;
                            },
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            initialValue: passwordConfirm,
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(25)),
                              labelText: 'Нууц үг баталгаажуулах',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(147, 157, 186, .78),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(width: 1)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.red)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromRGBO(147, 157, 186, .78),
                                size: 22,
                              ),
                            ),
                            onSaved: (val) => passwordConfirm = val,
                            validator: (val) {

                              if(val.isEmpty){
                                return 'Нууц үг баталгаажууна уу!';
                              } else {
                                  return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Container(
                            height: 46,
                            margin: EdgeInsets.only(top: 13),
                            decoration: BoxDecoration(
                              color: Color(0xff0079FF),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: FlatButton(
                              child: Container(
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        'Нууц үг солих'.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, .8),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onPressed: () {
                                final form = this._registerFormKey.currentState;
                                if (form.validate()) {
                                  form.save();
                                  this.doReset(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              height: 36,
              child: FlatButton(
                  padding: EdgeInsets.only(top: 15, left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back,
                        color: Color(0xff0079FF),
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Буцах',
                        style: TextStyle(
                            color: Color(0xff0079FF),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  onPressed: () => Navigator.pop(context)),
            ),
          ),
        ],
      ),
    );
  }
}
