import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommers_app/common/contoller/main_bottom_controller.dart';
import 'package:ostad_ecommers_app/features/home/widgets/product_catagori_items.dart';

class ProductCatagoriScreen extends StatefulWidget {
  const ProductCatagoriScreen({super.key});

  static const String name = '/product_catagori';

  @override
  State<ProductCatagoriScreen> createState() => _ProductCatagoriScreenState();
}

class _ProductCatagoriScreenState extends State<ProductCatagoriScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                _backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: const Text('Catagori'),
        ),
        body: SingleChildScrollView(
            child: GridView.builder(
          itemCount: 30,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
          ),
          itemBuilder: (context, index) {
            return const ProductCatagoriItems();
          },
        )),
      ),
    );
  }

  void _backToHome() {
    Get.find<MainBottomController>()
        .backToHome(); // Optionally, you can navigate to a specific screen if needed
    // Navigator.pushNamed(context, HomeScreen.name);
  }
}
