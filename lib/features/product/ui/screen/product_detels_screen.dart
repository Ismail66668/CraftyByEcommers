import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';
import 'package:ostad_ecommers_app/features/product/widgets/inc_dec_button.dart';
import 'package:ostad_ecommers_app/features/product/widgets/product_image_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  static const String name = '/product_details';
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Product Details')),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const ProductImageSlider(),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Niki 2480 is best selling 2025',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w800)),
                      Row(
                        children: [
                          IncDecButton(),
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Price',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text('\$ 100',
                                style: TextStyle(
                                    color: AppColors.themeColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800))
                          ],
                        ),
                        SizedBox(
                          width: 120,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Add To Card')),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
