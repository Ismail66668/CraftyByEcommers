import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/common/widget/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.catagoriName});
  static const String name = '/product_list_screen';
  final String catagoriName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catagoriName),
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
    );
  }
}
