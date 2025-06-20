import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';
import 'package:ostad_ecommers_app/features/product/ui/screen/rating.dart';
import 'package:ostad_ecommers_app/features/product/ui/screen/review_screen.dart';
import 'package:ostad_ecommers_app/features/product/widgets/color_picker.dart';
import 'package:ostad_ecommers_app/features/product/widgets/inc_dec_button.dart';
import 'package:ostad_ecommers_app/features/product/widgets/product_image_slider.dart';
import 'package:ostad_ecommers_app/features/product/widgets/size_picker.dart';

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
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductImageSlider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text('Niki 2480 is best selling 2025',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800)),
                        ),
                        Row(
                          children: [
                            IncDecButton(
                              onChange: (value) {
                                // Handle quantity change
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _onTapWriteReviewButton,
                          child: const Wrap(
                            children: [
                              Text('4.5',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                              Icon(Icons.star, color: Colors.amber, size: 20),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: _onTapReviewButton,
                          child: const Text(
                            'Review',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: AppColors.themeColor,
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.favorite_border,
                                color: Colors.white, size: 18),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text('Color',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w800)),
                    const SizedBox(height: 4),
                    ColorPicker(
                      color: const ['black', 'red', 'blue', 'green'],
                      onColorSelected: (String value) {
                        // Handle color selection
                      },
                    ),
                    const SizedBox(height: 4),
                    const Text('Size',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w800)),
                    const SizedBox(height: 4),
                    SizePicker(
                      size: const ['S', 'M', 'L', 'XL'],
                      onSizeSelected: (String size) {
                        // Handle size selection
                      },
                    ),
                    const SizedBox(height: 4),
                    const Text('Description',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w800)),
                    const Text(
                      'This is a sample product description. It provides detailsa of what to expect from the product.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void _onTapReviewButton() {
    Navigator.pushNamed(context, ReviewScreen.name);
  }

  void _onTapWriteReviewButton() {
    Navigator.pushNamed(context, Rating.name);
  }
}
