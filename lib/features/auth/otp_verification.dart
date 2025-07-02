import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommers_app/common/screen/main_botton_screen.dart';
import 'package:ostad_ecommers_app/core/ui/widgets/snekbar_massage.dart';
import 'package:ostad_ecommers_app/features/app_widgets/app_logo.dart';
import 'package:ostad_ecommers_app/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'data/model/verify_otp_request_model.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key, required this.email});
  static const String name = '/otpVerify';
  final String email;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final TextEditingController _pinCodeTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                'Please enter the OTP sent to your email address. ${widget.email}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: _pinCodeTEController,
                  appContext: context,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the OTP';
                    }
                    if (value.length < 4) {
                      return 'OTP must be 4 digits';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle OTP verification logic here
                  _onTapLoginButton(context);
                },
                child: const Text('Verify OTP'),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> _onTapLoginButton(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      VerifyOtpRequestModel model = VerifyOtpRequestModel(
          email: widget.email, otp: _pinCodeTEController.text);
      final bool isSuccess =
          await Get.find<VerifyOtpController>().verifyOtp(model);
      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            MainBottonScreen.name,
            (predicate) => false);
      } else {
        // ignore: use_build_context_synchronously
        showSnackbarMassage(context, 'un Success', true);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pinCodeTEController.dispose();
  }
}
