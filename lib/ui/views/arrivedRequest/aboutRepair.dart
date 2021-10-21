import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lambda/plugins/data_form/lambda_data_form.dart';
import 'package:ubengineering/core/controllers/appController.dart';
import 'package:ubengineering/ui/common/custom_header.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ubengineering/ui/helpers/success_modal.dart';

class AboutRepairScreen extends StatefulWidget {
  AboutRepairScreen({Key? key}) : super(key: key);

  @override
  _AboutRepairScreenState createState() => _AboutRepairScreenState();
}

class _AboutRepairScreenState extends State<AboutRepairScreen> {
  var requestID = Get.arguments;
  @override
  // void onSuccess(dynamic data) async {
  //   AwesomeDialog(
  //     context: context,
  //     dialogType: DialogType.SUCCES,
  //     animType: AnimType.BOTTOMSLIDE,
  //     headerAnimationLoop: false,
  //     title: 'Амжилттай',
  //     desc: 'Мэдээлэл илгээгдлээ',
  //     btnOkOnPress: () {
  //       Get.offNamedUntil('/fixer', (route) => false, arguments: 2,);
  //     },
  //     btnOkText: "Хаах",
  //   ).show();
  // }

  void onSuccess(dynamic data) async {
    successModal(context, 'Мэдээлэл амжилттай илгээгдээ.', () {
      Get.offNamedUntil(
        '/fixer',
        (route) => false,
        arguments: 2,
      );
    }, 'Хаах');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(context, 'Засвар хийсэн тухай'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(right: 0, top: 0, left: 0, bottom: 10),
              child: Column(
                children: <Widget>[
                  LambdaDataForm(
                    "25",
                    onSuccess: onSuccess,
                    saveBtnText: "Илгээх",
                    offlineSave: false,
                    // hiddenValues: hiddenData,
                    editMode: true,
                    editId: requestID,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
