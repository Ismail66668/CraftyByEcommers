import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommers_app/common/model/catagory_model.dart';
import 'package:ostad_ecommers_app/common/widget/product_card.dart';
import 'package:ostad_ecommers_app/features/product/controller/product_list_by_categary_controller.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.catagoriName});
  static const String name = '/product_list_screen';
  final CategoryModel catagoriName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final ProductByListCategoryController _productByListCategoryController =
      Get.find<ProductByListCategoryController>();
  @override
  void initState() {
    super.initState();
    _productByListCategoryController.getProductList(widget.catagoriName.id);
    _scrollController.addListener(listener);
  }

  void listener() {
    if (_scrollController.position.extentAfter < 300) {
      Get.find<ProductByListCategoryController>()
          .getProductList(widget.catagoriName.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catagoriName.title),
      ),
      body: GetBuilder<ProductByListCategoryController>(
          init: _productByListCategoryController,
          builder: (controller) {
            if (controller.initialLoadingInProgress) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: GridView.builder(
                    itemCount: controller.productModelList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 2.0,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                          child: ProductCard(
                        productModel: controller.productModelList[index],
                      ));
                    },
                  )),
                  Visibility(
                    visible: controller.inProgress,
                    child: const LinearProgressIndicator(),
                  )
                ],
              ),
            );
          }),
    );
  }
}
