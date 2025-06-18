import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({
    super.key,
    required this.onChange,
  });
  final Function(int) onChange;

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(() {
          if (quantity < 1) {
            return;
          }
          quantity--;
          widget.onChange(quantity);
          setState(() {});
        }, Icons.remove),
        const SizedBox(width: 5),
        Text(
          quantity.toString(),
          style: const TextStyle(
              color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w800),
        ),
        const SizedBox(width: 5),
        _buildIconButton(() {
          if (quantity >= 10) {
            return;
          }
          quantity++;
          widget.onChange(quantity);

          setState(() {});
        }, Icons.add),
      ],
    );
  }

  Widget _buildIconButton(Callback onTap, IconData icon) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(4)),
          child: Icon(icon, color: Colors.white, size: 20)),
    );
  }
}
