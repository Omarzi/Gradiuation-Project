import 'package:flutter/material.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';

class DefaultListTile extends StatelessWidget {
  final Icon leading;
  final Function() onTap;
  final Widget title;
  final Icon? trailing;

  const DefaultListTile({
    super.key,
    required this.leading,
    this.trailing,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      textColor: AppColors.blackColor,
      iconColor: AppColors.blackColor,
      leading: leading,
      onTap: onTap,
      title: title,
      style: ListTileStyle.list,
      trailing: trailing,
    );
  }
}
