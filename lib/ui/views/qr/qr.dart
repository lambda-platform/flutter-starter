import 'package:flutter/material.dart';
import 'package:ubengineering/ui/common/TopBar.dart';

class QR extends StatefulWidget {
  const QR({ Key? key }) : super(key: key);

  @override
  _QRState createState() => _QRState();
}

class _QRState extends State<QR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: topBar(
            context: context,
            headerText: 'Объектын мэдээлэл харах',
            isBottomTabScreen: true,
            //   goBack: goBack,
            //  previusIndex: previusIndex,
          ),
      body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.qr_code, size: 350),
            // Text('Total incoming calls: $count',
            //     style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: clear,
      //   child: Icon(Icons.clear_all),
      // ),
    ),
    );
  }
}