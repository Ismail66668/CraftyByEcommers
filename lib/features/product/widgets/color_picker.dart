import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker(
      {super.key, required this.color, required this.onColorSelected});
  final List<String> color;
  final Function(String) onColorSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (String color in widget.color)
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedColor = color;
              });
              widget.onColorSelected(color);
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: _selectedColor == color
                    ? AppColors.themeColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: _selectedColor == color
                      ? AppColors.themeColor
                      : Colors.black54,
                  width: 2,
                ),
              ),
              child: Text(color, style: const TextStyle(color: Colors.black54)),
            ),
          )
      ],
    );
  }
}
