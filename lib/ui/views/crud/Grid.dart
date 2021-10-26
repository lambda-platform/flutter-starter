import 'package:flutter/material.dart';
import 'package:lambda/plugins/data_grid/lambda_data_grid.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';
import 'package:lambdastarter/ui/views/crud/Form.dart';
import 'package:lambda/plugins/data_form/utils/offline_sync.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:lambdastarter/ui/fonts/esri_icons.dart';
class GridPage extends StatefulWidget {
  const GridPage({ Key? key }) : super(key: key);

  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  OFFLINE offline = new OFFLINE();
  List<dynamic> offlineData = [];

  Card listItem(dynamic row, Function rowOnTap) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      child: makeListTile(row, rowOnTap),
    ),
  );
  ListTile makeListTile(dynamic row, Function rowOnTap) => ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(
                  width: 1.0, color: Color.fromRGBO(64, 75, 96, .9)))),
      child: new GestureDetector(
          onTap: (){
            launch("tel://" + row["phone"].toString());
          },
          child: Column(
            children: [
              Icon(
                EsriIcons.phone,
                color: Color.fromRGBO(64, 75, 96, .9),
                size: 39,
              ),
              Text(
                row["phone"].toString(),
                style: TextStyle(
                    color: Color.fromRGBO(64, 75, 96, .9),
                    fontWeight: FontWeight.bold),
              )
            ],
          )
      ),
    ),
    title: new GestureDetector(
        onTap: (){
          launch("tel://" + row["phone"].toString());
        },
        child: Text(
          row["name"] ,
          style: TextStyle(
              color: Color.fromRGBO(64, 75, 96, .9), fontWeight: FontWeight.bold),
        )
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    trailing: Icon(Icons.keyboard_arrow_right,
        color: Color.fromRGBO(64, 75, 96, .9), size: 30.0) ,
    onTap: () {

        rowOnTap(row);
    },
  );


  void rowOnTap(dynamic row) {
      Get.to(DynamicForm(59, "Form demo", editId: row["id"]));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        mini: true,
        onPressed: () {
          Get.to(DynamicForm(59, "Form demo"));
        },
        child: Icon(Icons.add),
      ),
      body: LambdaDataGrid(
        "60",
        activeColor: primaryColor,
        rowOnTap: rowOnTap,
        offlineData: offlineData,
        listItem: listItem,
        // user_condition: '[{"grid_field":"user_id","user_field":"id"}]',
      ),
    );
  }
}