import 'dart:io';

import 'package:find_scan_return_app/app/di.dart';
import 'package:find_scan_return_app/presentation/qrcode/bloc/qr_bloc.dart';
import 'package:find_scan_return_app/presentation/qrcode/qrService/qr_service.dart';
import 'package:find_scan_return_app/presentation/resources/router/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const MaterialApp(home: MyHome()));
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRCodeScanerView(),
            ));
          },
          child: const Text('qrView'),
        ),
      ),
    );
  }
}

class QRCodeScanerView extends StatefulWidget {
  const QRCodeScanerView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRCodeScanerViewState();
}

class _QRCodeScanerViewState extends State<QRCodeScanerView> {
  final QrBloc qrBloc = sl<QrBloc>();
  QrService qrService = QrService();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrService.controller!.pauseCamera();
    }
    qrService.controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 4,
              child: BlocListener<QrBloc, QrState>(
                bloc: qrBloc,
                listener: (context, state) {
                  if (state is QrController) {
                    qrService.controller = state.qrViewController;
                  } else if (state is QrId) {
                    context.pushNamed(Routes.qrCodeVerificationScreen);
                  }
                },
                child: _buildQrView(context),
              )),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: qrService.onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => qrService.onPermissionSet(context, ctrl, p),
    );
  }

  @override
  void dispose() {
    qrService.controller?.dispose();
    super.dispose();
  }
}
