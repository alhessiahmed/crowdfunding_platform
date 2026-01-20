import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.iconPath,
    this.onIconTap,
  });
  final String title;
  final String? iconPath;
  final VoidCallback? onIconTap;
  @override
  Widget build(BuildContext context) {
    final resolvedIconPath = iconPath ?? ImagesManager.backIcon;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: onIconTap,
              child: SvgPicture.asset(resolvedIconPath, fit: BoxFit.contain),
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
