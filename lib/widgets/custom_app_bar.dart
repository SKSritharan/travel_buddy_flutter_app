import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_theme.dart';
import '../utils/custom_text_style.dart';
import './theme_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final VoidCallback? leadIconOnTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leadingIcon,
    this.leadIconOnTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context);
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(title, style: CustomTextStyle.titleMedium,),
      centerTitle: true,
      leading: leadingIcon != null
          ? IconButton(
              icon: Icon(leadingIcon),
              onPressed: leadIconOnTap,
            )
          : null,
      actions: [
        ThemeButton(appTheme: themeProvider),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
