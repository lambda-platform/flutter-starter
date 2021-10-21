import 'package:flutter/material.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';
import 'package:lambdastarter/ui/common/CustomIcons.dart';
import 'package:get/get.dart';
import 'package:lambda/modules/agent/agent_controller.dart';

Future<void> logoutModal(context) async {
  final AgentController _agentController = Get.put(AgentController());
  Future<void> logout() async{
    await _agentController.logout();
    Get.offAllNamed("/login");
  }
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18.0))),
          content: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: Icon(
                        Icons.close,
                        size: 28,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: mainColor,
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 72,
                                    height: 72,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 69,
                                    height: 69,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: mainColor,
                                    ),
                                    child: Icon(
                                      MyFlutterApp.warn,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            'Та системээс гарахдаа',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: darkGrey),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            'итгэлтэй байна уу?',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: darkGrey),
                          ),
                        ),
                        SizedBox(
                          height: 70.0,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                double.infinity,
                                56,
                              ),
                              primary: mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  16,
                                ),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                             // Navigator.of(context, rootNavigator: true).pop();
                              logout();
                            },
                            child: Text(
                              'Тийм',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                      ],
                    ),
                  ],
                )),
          ));
    },
  );
}
