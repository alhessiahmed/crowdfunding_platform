import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
  });

  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        if (actionText != null)
          TextButton(
            onPressed: onActionTap,
            child: Text(
              actionText!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorsManager.secondaryLight,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorsManager.secondaryLight,
                    decorationThickness: 1,
                  ),
            ),
          ),
      ],
    );
  }
}
