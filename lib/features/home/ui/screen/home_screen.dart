import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommers_app/app/asste_path.dart';
import 'package:ostad_ecommers_app/common/contoller/catagory_list_controller.dart';
import 'package:ostad_ecommers_app/common/contoller/main_bottom_controller.dart';
import 'package:ostad_ecommers_app/features/app_widgets/app_bar_icons.dart';
import 'package:ostad_ecommers_app/features/auth/loging_screen.dart';
import 'package:ostad_ecommers_app/features/home/ui/controller/home_slider_controller.dart';
import 'package:ostad_ecommers_app/features/home/widgets/product_catagori_items.dart';
import 'package:ostad_ecommers_app/features/home/widgets/product_searcg_bar.dart';
import 'package:ostad_ecommers_app/common/widget/product_card.dart';

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
              GetBuilder<HomeSliderController>(builder: (sliderController) {
                if (sliderController.inProgress) {
                  return const CircularProgressIndicator();
                }
                return HomeCarosulSlider(
                  slider: sliderController.sliderModelList,
                );
              }),
              const SizedBox(height: 10),
              _sectionHeader(() {
                Get.find<MainBottomController>().moveToChange();
              }, 'All Catagori', 'See All'),
              const SizedBox(height: 10),
              SizedBox(
                height: 130,
                child: getCatagoriList(),
              ),
              _sectionHeader(() {}, 'Poplur', 'See All'),
              const SizedBox(height: 10),
              _getProduct(),
              _sectionHeader(() {}, 'Spesal', 'See All'),
              const SizedBox(
                height: 8,
              ),
              _getProductList(),
              _sectionHeader(() {}, 'New', 'See All'),
              const SizedBox(
                height: 8,
              ),
              _getProductList(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _getProductList() {
    return SizedBox(
      height: 210,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            // return const ProductCard();
          },
        ),
      ),
    );
  }

  SingleChildScrollView _getProduct() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1, 2, 3, 4, 5]
            .map((e) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  // child: ProductCard(),
                ))
            .toList(),
      ),
    );
  }

  Widget getCatagoriList() {
    return SizedBox(
      height: 100,
      child: GetBuilder<CatagoryListController>(builder: (controller) {
        if (controller.initialLoadingInProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          primary: false,
          itemCount: controller.homeCategoryListItemLength,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: ProductCatagoriItems(
                categoryModel: controller.categoryModelList[index],
              ),
            );
          },
        );
      }),
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
          onTap: () {
            Navigator.pushNamed(context, LogingScreen.name);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const LogingScreen()));
          },
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
