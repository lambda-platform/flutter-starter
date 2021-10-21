import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambdastarter/ui/styles/_colors.dart' as prefix0;
import 'package:lambdastarter/ui/views/authentication/verify.dart';
import 'package:lambda/modules/network_util.dart';
import 'package:lambda/plugins/progress_dialog/progress_dialog.dart';


class RecoveryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  NetworkUtil _netUtil = new NetworkUtil();

  @override
  void initState() {
    super.initState();
  }

  doRecovery(BuildContext context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    ProgressDialog pr = new ProgressDialog(context, ProgressDialogType.Normal);
    await Future.delayed(Duration(milliseconds: 300));

    pr.setMessage('Түр хүлээнэ үү...');
    pr.show();

    var response = await _netUtil.post('/auth/send-forgot-mail', {
      "email": email,
    });

    if (response.status) {
      User user = new User.fromJson(response.data);
      final state = Provider.of<UserModel>(context, listen: false);
      state.setUser(user);
      pr.update(message: 'Нууц үг сэргээх код илгээгдлээ', type: 'success');
      pr.show();
      await new Future.delayed(const Duration(seconds: 1));
      pr.hide();

      Navigator.pushNamed(context, "/reset");
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
                  padding:
                      EdgeInsets.only(top: 50, left: 35, right: 35, bottom: 30),
                  child: Form(
                    key: _registerFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          initialValue: email,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(25)),
                            labelText: 'Бүртгэлтэй имэйл хаяг',
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
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.account_circle,
                                color: Color.fromRGBO(147, 157, 186, .78),
                                size: 22,
                              ),
                            ),
                          ),
                          validator: (val) {
                            return val.isEmpty
                                ? 'Имэйл хаягаа оруулна уу!'
                                : null;
                          },
                          onSaved: (val) => email = val,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 46,
                          margin: EdgeInsets.only(top: 13),
                          decoration: BoxDecoration(

                            borderRadius: new BorderRadius.circular(50.0),
                          ),
                          child: FlatButton(
                            child: Container(
                              child: Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      'Илгээх'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, .8),
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
                                this.doRecovery(context);
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
          )),
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
                        color: Color(0xFF0D47A1),
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Буцах',
                        style: TextStyle(
                            color: Color(0xFF0D47A1),
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
