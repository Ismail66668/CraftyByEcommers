import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostad_ecommers_app/app/asste_path.dart';

class Applogo extends StatelessWidget {
  const Applogo({super.key, this.hight, this.width});
  final double? hight;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AsstePath.appLogo,
      height: hight ?? 100,
      width: width ?? 100,
      fit: BoxFit.scaleDown,
    );
  }
}
