import 'package:lambdastarter/ui/fonts/esri_icons.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';
import 'package:flutter/material.dart';
import 'package:lambda/plugins/data_form/lambda_data_form.dart';
import 'package:lambda/modules/network_util.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:lambdastarter/ui/views/home/home.dart';
import 'package:lambdastarter/core/controllers/appController.dart';
import 'package:get/get.dart';
class DynamicForm extends StatefulWidget {
  final int? editId;
  final int schemaID;
  final String schemaName;

  DynamicForm(this.schemaID, this.schemaName, {Key? key, this.editId = 0}) : super(key: key);

  @override
  _DynamicForm createState() => new _DynamicForm();
}

class _DynamicForm extends State<DynamicForm> {
  NetworkUtil _netUtil = new NetworkUtil();
  bool editMode = false;
  static AppController _appController = Get.find();
  @override
  void initState() {
    super.initState();


    if(widget.editId! >= 1){
      setState(() {
        editMode = true;
      });
    }

  }

  void onSuccess(dynamic data) async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      headerAnimationLoop: false,
      title: 'Амжилттай',
      desc: 'Амжилттай илгээгдлээ',
      btnOkOnPress: () {

        Get.back();
      },
      btnOkText: "Хаах",
    ).show();
  }

  @override
  Widget build(BuildContext context) {


    Map<String, dynamic> hiddenData = {
//      "district_id":user.districtId,
//      "user_id":user.id,
//      "tuluw_id":1,
//      "shaardlaga_hangaigui_shaltgaan":" ",
//      "region_id":user.regionId
    };
//    if(widget.location != "" && widget.location != null){
//      hiddenData["location"] = widget.location;
//    }

    print(widget.schemaName);
    print(widget.schemaID);
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          widget.schemaName
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(right: 0, top: 0, left: 0, bottom: 10),
            child:Column(
              children: <Widget>[

                LambdaDataForm(
                    widget.schemaID.toString(),
                    onSuccess: onSuccess,
//                    user_condition:'[{"form_field":"region_id","user_field":"region_id"},{"form_field":"district_id","user_field":"district_id"}]',
                    hiddenValues:hiddenData,
                    editMode: editMode,
                    editId:widget.editId
                ),

              ],
            )
        ),
      ),
    );
  }
}
