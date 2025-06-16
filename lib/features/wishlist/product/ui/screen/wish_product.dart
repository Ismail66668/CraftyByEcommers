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
        Get.find<MainBottomController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish Product List'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.find<MainBottomController>().backToHome();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
              child: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return const FittedBox(child: ProductCard());
            },
          )),
        ),
      ),
    );
  }
}
