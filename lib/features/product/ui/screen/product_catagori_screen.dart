import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
    );
  }
}
