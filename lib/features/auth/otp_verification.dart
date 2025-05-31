import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/features/auth/set_password.dart';
import 'package:ostad_ecommers_app/features/ui/widgets/app_logo.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({super.key});
  static const String name = '/otpVerify';

  final TextEditingController _pinCodeTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 130,
              ),
              const Center(
                child: Applogo(
                  hight: 100,
                  width: 100,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Verify Your OTP',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Please enter the OTP sent to your email address.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _pinCodeTEController,
                appContext: context,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle OTP verification logic here
                  _onTapsetPassword(context);
                },
                child: const Text('Verify OTP'),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void _onTapsetPassword(BuildContext context) {
    Navigator.pushReplacementNamed(context, SetPassword.name);
  }
}
