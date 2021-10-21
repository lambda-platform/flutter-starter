import 'package:flutter/material.dart';
import 'package:lambda/plugins/chart/lambda_chart.dart';
import 'package:get/get.dart';

class ChartExample extends StatefulWidget {
  const ChartExample({ Key? key }) : super(key: key);

  @override
  _ChartExampleState createState() => _ChartExampleState();
}

class _ChartExampleState extends State<ChartExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // reloadAfterInit:true,

        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          title: Text("Lambda chart Жишээ"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //  LambdaChart('9'),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: clear,
      //   child: Icon(Icons.clear_all),
      // ),
    );
  }
}