import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker(
      {super.key, required this.size, required this.onSizeSelected});
  final List<String> size;
  final Function(String) onSizeSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (String size in widget.size)
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedSize = size;
            });
            widget.onSizeSelected(size);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _selectedSize == size
                  ? AppColors.themeColor
                  : Colors.transparent,
              border: Border.all(
                color: Colors.black54,
                width: 2,
              ),
            ),
            child: Text(size, style: const TextStyle(color: Colors.black54)),
          ),
        )
    ]);
  }
}
