import 'package:e_waris/core/constants/app_fonts.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color textColor;
  final String text;
  final IconData? leading;
  final VoidCallback? onTap;
  final bool isActionRequires;

  const CustomAppBar({
    super.key,
    this.leading,
    required this.textColor,
    required this.text,
    this.onTap,
    this.isActionRequires= true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title:CustomText(text: text,fontColor: textColor,fontSize: 26,fontFamily: AppFonts.robotoBold,),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}