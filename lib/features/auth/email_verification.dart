import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/features/auth/otp_verification.dart';
import 'package:ostad_ecommers_app/features/app_widgets/app_logo.dart';

class EmailVerification extends StatelessWidget {
  EmailVerification({super.key});
  static const String name = '/emailVerify';
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              const Center(
                child: Applogo(
                  hight: 100,
                  width: 100,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'To Verify Your Email',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Please enter your email address to receive a verification code.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _onTapLoging(context);
                },
                child: const Text(
                  'Verify Email',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapLoging(BuildContext context) {
    Navigator.pushReplacementNamed(context, OtpVerification.name);
  }
}
