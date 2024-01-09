import 'package:evil_flour/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'main.dart';

class ScannerPage extends StatefulWidget {
  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String _scanCode = '';

  final qrKey = GlobalKey();
  String qrData = 'Hello! Buddy';

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(title: const Text("Lettura codice QR"), centerTitle: true),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _scanCode.isEmpty
            ? SizedBox()
            : Text(
                "Scanned Code -  $_scanCode",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
        SizedBox(height: 20),
        Center(
            child: RepaintBoundary(
          key: qrKey,
          child: QrImageView(
            data: _scanCode,
            size: 250,
            backgroundColor: Colors.white30,
            gapless: true,
            eyeStyle: const QrEyeStyle(
                color: Colors.black, eyeShape: QrEyeShape.square),
            version: QrVersions.auto,
          ),
        )),
        ElevatedButton(
            onPressed: () {
              scanQR();
            },
            child: Text("Scan Code")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetail(
                          productId: _scanCode,
                        )),
              );
            },
            child: Text("Show product detail")),
      ]),
    );
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanCode = barcodeScanRes;
    });
  }
}
