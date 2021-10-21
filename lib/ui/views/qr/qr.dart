import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lambdastarter/ui/common/custom_header.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QR extends StatefulWidget {
  const QR({Key? key}) : super(key: key);

  @override
  _QRState createState() => _QRState();
}

class _QRState extends State<QR> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  late QRViewController controller;
  bool? isCorrectQr = null;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        if (scanData.code.toString().substring(0, 5) == "UBENG") {
          controller.pauseCamera();
          isCorrectQr = true;
          result = scanData;
          int fIndex = scanData.code.toString().indexOf("F");
          new Future.delayed(
              const Duration(seconds: 1),
              () => {
                    Get.toNamed("/attribute", arguments: [
                      controller,
                      scanData.code.toString().substring(6, fIndex),
                      scanData.code.toString().substring(fIndex + 1),
                    ])!
                        .whenComplete(
                      () => setState(
                        () {
                          result = null;
                          isCorrectQr = null;
                        },
                      ),
                    )
                  });
        } else {
          isCorrectQr = false;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   setState(() {
  //     result = null;
  //   });
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(context, 'Объектын  мэдээлэл харах'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
            ),
            SizedBox(
              height: 100.0,
            ),
            Center(
              child: Text(
                (result == null && isCorrectQr == null)
                    ? 'Та QR кодоо уншуулна уу!'
                    : isCorrectQr!
                        ? 'Амжилттай'
                        : 'Буруу QR код байна!',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(
                    0xFF5D6373,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
