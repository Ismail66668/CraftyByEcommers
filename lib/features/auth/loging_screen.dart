import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommers_app/common/screen/main_botton_screen.dart';
import 'package:ostad_ecommers_app/common/widget/circlur_progress_indicator.dart';
import 'package:ostad_ecommers_app/core/ui/widgets/snekbar_massage.dart';
import 'package:ostad_ecommers_app/features/auth/data/model/login_request_model.dart';
import 'package:ostad_ecommers_app/features/auth/singup_screen.dart';
import 'package:ostad_ecommers_app/features/app_widgets/app_logo.dart';
import 'package:ostad_ecommers_app/features/auth/ui/controller/loging_controller.dart';

class LogingScreen extends StatefulWidget {
  const LogingScreen({super.key});
  static const String name = '/loging';

  @override
  State<LogingScreen> createState() => _LogingScreenState();
}

class _LogingScreenState extends State<LogingScreen> {
  final GlobalKey<FormState> _fromKye = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LogingController _logingController = Get.find<LogingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
              child: Form(
            key: _fromKye,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Please login to your account',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                      // } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{}$')
                      //     .hasMatch(value)) {
                      //   return 'Password must contain letters and numbers';
                      // }
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(height: 18),
                GetBuilder<LogingController>(builder: (controller) {
                  return Visibility(
                      visible: controller.inProgress == false,
                      replacement: const CirclurProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: () {
                          _onTapSingIn();
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                      ));
                }),
                const SizedBox(height: 10),
                RichText(
                    text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _onTapLoging(context),
                    ),
                  ],
                )),
              ],
            ),
          )),
        ),
      ),
    );
  }

  Future<void> _onTapSingIn() async {
    if (_fromKye.currentState!.validate()) {
      LogingRequestModel model = LogingRequestModel(
          email: _emailController.text.trim(),
          password: _passwordController.text);

      final bool isSuccess = await _logingController.loging(model);
      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            MainBottonScreen.name,
            (predicate) => false);
        // ignore: use_build_context_synchronously
        showSnackbarMassage(context, 'Successfully Loging', false);
      } else {
        // ignore: use_build_context_synchronously
        showSnackbarMassage(context, _logingController.errorMessage!, true);
      }
    }
  }

  void _onTapLoging(BuildContext context) {
    Navigator.pushReplacementNamed(context, SingupScreen.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
