import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';
import 'package:ostad_ecommers_app/app/asste_path.dart';
import 'package:ostad_ecommers_app/common/contoller/main_bottom_controller.dart';
import 'package:ostad_ecommers_app/features/product/widgets/inc_dec_button.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});
  static const String name = '/card_screen';

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _backToHome();
        // Handle the pop event and return a result if needed
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Card Screen'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: _backToHome,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 13,
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AsstePath.navLogo,
                          width: 100,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    'Product Name',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      // Handle delete action
                                    },
                                  )
                                ],
                              ),
                              const Text(
                                'Color: Red, Size: M',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$100',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.themeColor),
                                  ),
                                  IncDecButton(onChange: (value) {
                                    // Handle quantity change
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
                },
              ),
            ),
            _priceChekOut(),
          ],
        ),
      ),
    );
  }

  Container _priceChekOut() {
    return Container(
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
            child:
                ElevatedButton(onPressed: () {}, child: const Text('cheakout')),
          )
        ],
      ),
    );
  }

  void _backToHome() {
    Get.find<MainBottomController>().backToHome();
  }
}
