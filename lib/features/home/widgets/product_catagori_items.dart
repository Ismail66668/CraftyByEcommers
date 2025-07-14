import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';
import 'package:ostad_ecommers_app/common/model/catagory_model.dart';
import 'package:ostad_ecommers_app/features/product/ui/screen/product_list_screen.dart';

class ProductCatagoriItems extends StatelessWidget {
  const ProductCatagoriItems({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name,
            arguments: categoryModel.title);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.themeColor.withOpacity(0.3),
            ),
            child: Image.network(
              categoryModel.iconUrl,
              width: 32,
              height: 32,
            ),
          ),
          const SizedBox(height: 3),
          Text(getTitle(categoryModel.title),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.themeColor)),
        ],
      ),
    );
  }

  String getTitle(String string) {
    if (string.length > 8) {
      return '${string.substring(0, 8)}...';
    }
    return string;
  }
}
