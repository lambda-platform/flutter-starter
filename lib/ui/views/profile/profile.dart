
import 'package:lambdastarter/ui/styles/_colors.dart';
import 'package:flutter/material.dart';
import 'package:lambda/plugins/data_form/lambda_data_form.dart';
import 'package:lambdastarter/core/controllers/appController.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ProfileScreen extends StatefulWidget {
  final String? location;

  ProfileScreen({Key? key, this.location}) : super(key: key);

  @override
  _ProfileScreen createState() => new _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {

  static AppController _appController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  void onSuccess(dynamic data) async {





    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      headerAnimationLoop: false,
      title: 'Амжилттай',
      desc: 'Хувийн мэдээлэл илгээгдлээ',
      btnOkOnPress: () {

      },
      btnOkText: "Хаах",
    ).show();
  }

  @override
  Widget build(BuildContext context) {


    Map<String, dynamic> hiddenData = {
     // "district_id":user.districtId,
     "user_id":_appController.user.value.id ?? 0,
//      "tuluw_id":1,
      "shaardlaga_hangaigui_shaltgaan":" ",
//      "region_id":user.regionId
    };
    if(widget.location != "" && widget.location != null){
      hiddenData["location"] = widget.location;
    }
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Хувийн мэдээлэл',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(right: 0, top: 0, left: 0, bottom: 10),
            child:Column(
              children: <Widget>[
                LambdaDataForm(
                    "user_profile",
                    onSuccess: onSuccess,
                    offlineSave:false,
                    editMode: true,
                    // isPublic: true,
                    editId:_appController.user.value.id ?? 0
                ),

              ],
            )
        ),
      ),
    );
  }
}
