import 'package:flutter/material.dart';
import 'package:whatword/shared/themes/app_colors.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  const InputTextWidget(
      {Key? key, required this.label, required this.onChanged, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.heading),
        hintText: 'Type the $label',
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
