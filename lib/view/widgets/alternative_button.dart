import 'package:flutter/material.dart';

import '../../controller/core/constants/colors_manager.dart';

class AlternativeButton extends StatelessWidget {
  const AlternativeButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? ColorsManager.bgSectionDark
            : ColorsManager.bgSectionLight,
        foregroundColor: Theme.of(context).textTheme.bodyLarge!.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFF2358B3), width: 2),
        ),
      ),
      child: Text(text),
    );
  }
}
