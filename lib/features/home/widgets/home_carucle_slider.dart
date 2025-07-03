import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';
import 'package:ostad_ecommers_app/features/home/data/model/slider_model.dart';

class HomeCarosulSlider extends StatefulWidget {
  const HomeCarosulSlider({
    super.key,
    required this.slider,
  });
  final List<SliderModel> slider;

  @override
  State<HomeCarosulSlider> createState() => _HomeCarosulSliderState();
}

class _HomeCarosulSliderState extends State<HomeCarosulSlider> {
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              onPageChanged: (int curentendex, _) {
                currentIndex.value = curentendex;
              },
              height: 170.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enlargeCenterPage: true,
              viewportFraction: 1.0),
          items: widget.slider.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(slider.photoUrl),
                            fit: BoxFit.cover),
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text(
                      slider.description,
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.white),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: currentIndex,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++) ...[
                      Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              i == value ? AppColors.themeColor : Colors.grey,
                        ),
                      )
                    ]
                  ],
                );
              },
            )
          ],
        )
      ],
    );
  }
}
