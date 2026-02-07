import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  const TransparentButton({
    super.key,
    this.onPressed,
    this.isRow = false,
    this.child,
    required this.text,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isRow;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // () {
      // Get.offNamed(RoutesManager.signUpScreen);
      // }
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.surface,
        shadowColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide.none,
        ),
        surfaceTintColor: Colors.transparent,
      ),
      child: isRow
          ? child
          : Text(
              text,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
    );
  }
}
