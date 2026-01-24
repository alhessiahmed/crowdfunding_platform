import 'package:crowdfunding_platform/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AppbarSection extends StatelessWidget {
  const AppbarSection({super.key, this.title, this.subTitle, this.onBack});
  final String? title;
  final String? subTitle;
  final VoidCallback? onBack;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: title ?? '', onIconTap: onBack),
        SizedBox(height: 8),
        Text(
          subTitle ?? '',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
