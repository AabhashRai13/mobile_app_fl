import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class QrCodeVerification extends StatefulWidget {
  const QrCodeVerification({super.key});

  @override
  State<QrCodeVerification> createState() => _QrCodeVerificationState();
}

class _QrCodeVerificationState extends State<QrCodeVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.verification),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppStrings.waitWhileVerified),
            SizedBox(
              height: getProportionateScreenHeight(100),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
