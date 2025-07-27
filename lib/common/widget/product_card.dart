// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';
import 'package:ostad_ecommers_app/common/model/product_model.dart';
import 'package:ostad_ecommers_app/features/product/ui/screen/product_detels_screen.dart';

class ProductCard extends StatelessWidget {
  // ignore: use_super_parameters
  const ProductCard({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name,
            arguments: productModel.id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                color: AppColors.themeColor.withOpacity(0.1),
                spreadRadius: 0.5,
                blurRadius: 7,
                offset: const Offset(0, 0.3), // changes position of shadow
              ),
            ]),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8))),
              width: 160,
              child: Image.network(
                productModel.photoUrl.first,
                height: 135,
                width: 160,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 0.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(productModel.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${productModel.currentPrice}',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.themeColor)),
                        const Wrap(
                          children: [
                            Text('4.5',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: AppColors.themeColor,
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.favorite_border,
                                  color: Colors.white, size: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
