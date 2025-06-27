import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommers_app/common/widget/circlur_progress_indicator.dart';
import 'package:ostad_ecommers_app/core/ui/widgets/snekbar_massage.dart';
import 'package:ostad_ecommers_app/features/auth/data/model/singup_request_model.dart';
import 'package:ostad_ecommers_app/features/auth/loging_screen.dart';
import 'package:ostad_ecommers_app/features/app_widgets/app_logo.dart';
import 'package:ostad_ecommers_app/features/auth/otp_verification.dart';
import 'package:ostad_ecommers_app/features/auth/ui/controller/sing_up_controller.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});
  static const String name = '/singup';

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final GlobalKey<FormState> _fromKye = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fastnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _citynameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SingUpController singUpController = Get.find<SingUpController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
              key: _fromKye,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const Center(
                    child: Applogo(
                      hight: 130,
                      width: 130,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Register Account',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Please Enter your details to singup',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      RegExp emailRegex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'email',
                      hintText: 'Enter your email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _fastnameController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Fast Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Fast Name',
                      hintText: 'Enter your Fast Name',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _lastnameController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Last Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      hintText: 'Enter your Last Name',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      RegExp phoneRegex = RegExp(r'^\+?[0-9]{11}$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Phone Number';
                      } else if (!phoneRegex.hasMatch(value)) {
                        return 'Please enter a valid Phone Number';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: ' Mobile Number',
                      hintText: 'Enter your Mobile Number',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _citynameController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your City Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: ' City Name',
                      hintText: 'Enter your City Name',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLines: 3,
                    controller: _addressController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Address';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Shiping Address',
                      hintText: 'Enter your Address',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your Password',
                    ),
                  ),
                  const SizedBox(height: 10),
                  GetBuilder<SingUpController>(builder: (controller) {
                    return Visibility(
                      visible: singUpController.lodingProggress == false,
                      replacement: const CirclurProgressIndicator(),
                      child: ElevatedButton(
                          onPressed: () {
                            _onTapSingup();
                          },
                          child: const Text('SINGUP')),
                    );
                  }),
                  const SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                                context, LogingScreen.name);
                          },
                      ),
                    ],
                  )),
                ],
              )),
        ),
      ),
    ));
  }

  Future<void> _onTapSingup() async {
    if (_fromKye.currentState!.validate()) {
      final SingupRequestModel model = SingupRequestModel(
          password: _passwordController.text,
          firstName: _fastnameController.text.trim(),
          lastName: _lastnameController.text.trim(),
          phone: _phoneController.text.trim(),
          city: _citynameController.text.trim(),
          email: _emailController.text.trim());

      await singUpController.singup(model);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, OtpVerification.name);
    }
  }

  @override
  void dispose() {
    _fastnameController.dispose();
    _lastnameController.dispose();
    _citynameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
