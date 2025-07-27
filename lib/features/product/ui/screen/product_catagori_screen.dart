import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommers_app/common/contoller/catagory_list_controller.dart';
import 'package:ostad_ecommers_app/common/contoller/main_bottom_controller.dart';
import 'package:ostad_ecommers_app/features/home/widgets/product_catagori_items.dart';

class ProductCatagoriScreen extends StatefulWidget {
  const ProductCatagoriScreen({super.key});

  static const String name = '/product_catagori';

  @override
  State<ProductCatagoriScreen> createState() => _ProductCatagoriScreenState();
}

class _ProductCatagoriScreenState extends State<ProductCatagoriScreen> {
  final ScrollController scrollController = ScrollController();

  final ScrollController _scrollController = ScrollController();
  final CatagoryListController _categoryListController =
      Get.find<CatagoryListController>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentBefore < 300) {
      _categoryListController.categoryModelList;
    }
  }

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
        body: GetBuilder<CatagoryListController>(builder: (controller) {
          if (controller.initialLoadingInProgress) {
            return const CircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SingleChildScrollView(
                      child: GridView.builder(
                    controller: scrollController,
                    itemCount: controller.categoryModelList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: ProductCatagoriItems(
                          categoryModel: controller.categoryModelList[index],
                        ),
                      );
                    },
                  )),
                ),
              ),
              Visibility(
                visible: controller.inProgress,
                child: const LinearProgressIndicator(),
              )
            ],
          );
        }),
      ),
    );
  }

  void _backToHome() {
    Get.find<MainBottomController>()
        .backToHome(); // Optionally, you can navigate to a specific screen if needed
    // Navigator.pushNamed(context, HomeScreen.name);
  }
}
