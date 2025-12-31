import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_forge_assesment/core/theme/app_colors.dart';
import 'package:think_forge_assesment/navigation/bottom_nav_provider.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24), // Padding for the floating effect
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, 0, 'Home', Icons.home_outlined),
            _buildNavItem(context, 1, 'Wallet', Icons.account_balance_wallet_outlined),
            _buildNavItem(context, 2, 'Support', Icons.support_agent_outlined),
            _buildNavItem(context, 3, 'IB', Icons.monetization_on),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, String label, IconData icon) {
    final navProvider = context.watch<BottomNavProvider>();
    final bool isSelected = navProvider.index == index;
    final color = isSelected ? AppColors.primary : AppColors.textSecondary;

    return InkWell(
      onTap: () => navProvider.changeIndex(index),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
