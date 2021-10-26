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


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           LambdaChart('58'),
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