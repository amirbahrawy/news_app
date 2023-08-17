import 'package:flutter/material.dart';

import '../res/colors/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  static const _preferredSize = 60.0;
  static get preferredSize => const Size.fromHeight(_preferredSize);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppColors.PRIMARY_GRADIENT),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title),
        actions: actions,
        leading: leading,
      ),
    );
  }
}
