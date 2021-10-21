import 'package:flutter/material.dart';
import 'package:lambda/plugins/data_form/lambda_data_form.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ubengineering/ui/styles/_colors.dart';
class UserRequest extends StatefulWidget {
  const UserRequest({ Key? key }) : super(key: key);

  @override
  _UserRequestState createState() => _UserRequestState();
}

class _UserRequestState extends State<UserRequest> {
  @override

  void onSuccess(dynamic data) async {





    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      headerAnimationLoop: false,
      title: 'Амжилттай',
      desc: 'Мэдээлэл илгээгдлээ',
      btnOkOnPress: () {

      },
      btnOkText: "Хаах",
    ).show();
  }

  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(right: 0, top: 0, left: 0, bottom: 10),
            child:Column(
              children: <Widget>[
                LambdaDataForm(
                    "3",
                    onSuccess: onSuccess,
                    saveBtnText: "Илгээх",
                    offlineSave:false,

                ),

              ],
            )
        ),
      ),
    );
  }
}