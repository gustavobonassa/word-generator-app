import 'package:flutter/material.dart';
import 'package:whatword/shared/themes/app_colors.dart';
import 'package:whatword/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const LabelButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        label,
        style: TextStyle(
          color: AppColors.background,
          fontSize: 20,
        ),
      ),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(backgroundColor: AppColors.secondary),
    );
  }
}
