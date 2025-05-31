import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostad_ecommers_app/app/asste_path.dart';
import 'package:ostad_ecommers_app/features/ui/screen/home_screen/ui/widgets/app_bar_icons.dart';
import 'package:ostad_ecommers_app/features/ui/screen/home_screen/ui/widgets/product_searcg_bar.dart';

import '../widgets/home_carucle_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              ProductSearchBar(),
              SizedBox(height: 16),
              HomeCarosulSlider()
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: SvgPicture.asset(AsstePath.navLogo),
      actions: [
        AppBarIconWidget(
          onTap: () {},
          icon: Icons.person,
        ),
        AppBarIconWidget(
          onTap: () {},
          icon: Icons.call,
        ),
        AppBarIconWidget(
          onTap: () {},
          icon: Icons.notification_add,
        ),
      ],
    );
  }
}
