import 'dart:convert';
import 'dart:developer';
import 'package:find_scan_return_app/app/di.dart';
import 'package:find_scan_return_app/domain/entities/qr_code.dart';
import 'package:find_scan_return_app/presentation/qrcode/bloc/qr_bloc.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrService {
  QRViewController? controller;
  final QrBloc qrBloc = sl<QrBloc>();
  late QrCode qrCode;
  void onQRViewCreated(QRViewController controller) {
    qrBloc.add(SetController(controller: controller));

    // this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      log("----------- qr code ----------");
      log(scanData.code!);
      qrCode = QrCode.fromJson(jsonDecode(scanData.code!));
      if (qrCode.qrId.isNotEmpty) {
        log("qrcode id ${qrCode.qrId}");
        qrBloc.add(SetQrId(qrId: int.parse(qrCode.qrId)));
      }
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
