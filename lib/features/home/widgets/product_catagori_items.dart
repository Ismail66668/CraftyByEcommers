import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';
import 'package:ostad_ecommers_app/features/product/ui/screen/product_list_screen.dart';

class ProductCatagoriItems extends StatelessWidget {
  const ProductCatagoriItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name,
            arguments: 'computers');
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.themeColor.withOpacity(0.3),
            ),
            child: Icon(Icons.category, size: 48, color: AppColors.themeColor),
          ),
          const SizedBox(height: 3),
          Text('Computers',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.themeColor)),
        ],
      ),
    );
  }
}
