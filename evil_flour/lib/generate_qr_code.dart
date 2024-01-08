import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  late QrImageView _qrImageView;

  @override
  void initState() {
    String qrData = 'Hello! Buddy';
    _qrImageView = QrImageView(
      data: qrData,
      version: QrVersions.auto,
      size: 200.0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _qrImageView,
    );
  }
}
