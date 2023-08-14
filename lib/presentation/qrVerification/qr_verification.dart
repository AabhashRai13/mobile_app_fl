import 'package:find_scan_return_app/app/di.dart';
import 'package:find_scan_return_app/presentation/qrVerification/cubit/qr_id_verification_cubit.dart';
import 'package:find_scan_return_app/presentation/qrcode/qrService/qr_service.dart';
import 'package:find_scan_return_app/presentation/resources/router/routes_manager.dart';
import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class QrCodeVerification extends StatefulWidget {
  const QrCodeVerification({super.key});

  @override
  State<QrCodeVerification> createState() => _QrCodeVerificationState();
}

class _QrCodeVerificationState extends State<QrCodeVerification> {
  final QrIdVerificationCubit qrIdVerificationCubit =
      sl<QrIdVerificationCubit>();
  final QrService qrService = sl<QrService>();
  @override
  void initState() {
    super.initState();
    qrIdVerificationCubit.checkIfQrIdValid(int.parse(qrService.qrCode.qrId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.verification),
      ),
      body: BlocListener<QrIdVerificationCubit, QrIdVerificationState>(
        bloc: qrIdVerificationCubit,
        listener: (context, state) {
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(AppStrings.qrIdScanError)),
            );
            Navigator.pop(context);
          } else if (state is QrIDVerification) {
            if (state.isValid) {
              context.goNamed(Routes.signUp);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(AppStrings.qrIdNotValid)),
              );
              Navigator.pop(context);
            }
          }
        },
        child: Center(
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
      ),
    );
  }
}
