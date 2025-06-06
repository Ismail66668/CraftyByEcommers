import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostad_ecommers_app/app/asste_path.dart';
import 'package:ostad_ecommers_app/features/app_widgets/app_bar_icons.dart';
import 'package:ostad_ecommers_app/features/home/widgets/product_catagori_items.dart';
import 'package:ostad_ecommers_app/features/home/widgets/product_searcg_bar.dart';
import 'package:ostad_ecommers_app/features/product/ui/screen/product_catagori_screen.dart';

import '../../widgets/home_carucle_slider.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const ProductSearchBar(),
              const SizedBox(height: 16),
              const HomeCarosulSlider(),
              const SizedBox(height: 10),
              _sectionHeader(() {
                Navigator.pushNamed(context, ProductCatagoriScreen.name);
              }, 'All Catagori', 'See All'),
              const SizedBox(height: 10),
              SizedBox(
                height: 130,
                child: getCatagoriList(),
              ),
              _sectionHeader(() {}, 'Poplur', 'See All'),
              _sectionHeader(() {}, 'Spesal', 'See All'),
              _sectionHeader(() {}, 'New', 'See All'),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCatagoriList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      primary: false,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Card(
          elevation: 0,
          child: ProductCatagoriItems(),
        );
      },
    );
  }

  Widget _sectionHeader(VoidCallback onTap, String title, String buttonText) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const Spacer(),
        TextButton(
          onPressed: onTap,
          child: Text(buttonText,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.blue,
                  )),
        ),
      ],
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
