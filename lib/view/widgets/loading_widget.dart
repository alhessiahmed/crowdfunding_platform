import 'package:flutter/material.dart';

import '../../controller/core/constants/colors_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.black.withAlpha(51),
      child: const CircularProgressIndicator(color: ColorsManager.white),
    );
  }
}
