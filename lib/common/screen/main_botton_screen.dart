import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommers_app/common/contoller/main_bottom_controller.dart';
import 'package:ostad_ecommers_app/features/home/ui/screen/home_screen.dart';
import 'package:ostad_ecommers_app/features/product/ui/screen/product_catagori_screen.dart';
import 'package:ostad_ecommers_app/features/wishlist/product/ui/screen/wish_product.dart';

class MainBottonScreen extends StatefulWidget {
  const MainBottonScreen({super.key});
  static const String name = '/main_botton_screen';

  @override
  State<MainBottonScreen> createState() => _MainBottonScreenState();
}

class _MainBottonScreenState extends State<MainBottonScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const ProductCatagoriScreen(),
    const ProductCatagoriScreen(),
    const WishProductList(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomController>(builder: (navIndexController) {
      return Scaffold(
          body: screens[navIndexController.selectdeIndex],
          bottomNavigationBar: NavigationBar(
              selectedIndex: navIndexController.selectdeIndex,
              onDestinationSelected: navIndexController.changeIndex,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.category),
                  label: 'Category',
                ),
                NavigationDestination(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                NavigationDestination(
                  icon: Icon(Icons.favorite),
                  label: 'Wishlist',
                )
              ]));
    });
  }
}
