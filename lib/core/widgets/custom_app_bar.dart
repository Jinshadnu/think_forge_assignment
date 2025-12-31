import 'package:flutter/material.dart';
import 'package:think_forge_assesment/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: Colors.white24),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/profile_icon.jpg'),
            ),
          ),
        ),
      ),
      title: Image.network('https://img.pikbest.com/origin/10/41/85/35HpIkbEsTU62.png!w700wp', height: 50,), // Replace with your logo asset
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white24),
              borderRadius: BorderRadius.circular(6),
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_none, color: AppColors.textPrimary),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
