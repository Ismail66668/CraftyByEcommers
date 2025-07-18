import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommers_app/app/app_routes.dart';
import 'package:ostad_ecommers_app/app/app_thems.dart';
import 'package:ostad_ecommers_app/app/controller_binders.dart';
import 'package:ostad_ecommers_app/features/auth/splash_screen.dart';

class CraftyeBye extends StatefulWidget {
  const CraftyeBye({super.key});

  @override
  State<CraftyeBye> createState() => _CraftyeByeState();
}

class _CraftyeByeState extends State<CraftyeBye> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: ControllerBinders(),
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightThemsData,
        initialRoute: SplashScreen.name,
        onGenerateRoute: AppRoutes().route);
  }
}
