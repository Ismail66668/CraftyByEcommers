import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({
    super.key,
  });

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  ValueNotifier<int> quantity = ValueNotifier(1);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(() {
          if (quantity.value > 0) quantity.value--;
        }, Icons.remove),
        const SizedBox(width: 5),
        ValueListenableBuilder(
          valueListenable: quantity,
          builder: (context, value, child) {
            return Text(
              value.toString(),
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            );
          },
        ),
        const SizedBox(width: 5),
        _buildIconButton(() {
          if (quantity.value >= 10) {
            return;
          }
          quantity.value++;
        }, Icons.add),
      ],
    );
  }

  Widget _buildIconButton(Callback onTap, IconData icon) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, color: Colors.white, size: 20)),
    );
  }
}
