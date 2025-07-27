import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommers_app/common/contoller/main_bottom_controller.dart';
import 'package:ostad_ecommers_app/common/widget/product_card.dart';

class WishProductList extends StatefulWidget {
  const WishProductList({super.key});
  static const String name = '/wish_product_list';

  @override
  State<WishProductList> createState() => _WishProductListState();
}

class _WishProductListState extends State<WishProductList> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish Product List'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _backToHome();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Expanded(
              child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              // return const FittedBox(child: ProductCard());
            },
          )),
        ),
      ),
    );
  }

  void _backToHome() {
    Get.find<MainBottomController>().backToHome();
  }
}
