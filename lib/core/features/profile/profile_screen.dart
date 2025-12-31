import 'package:flutter/material.dart';
import 'package:think_forge_assesment/core/theme/app_colors.dart';
import 'package:think_forge_assesment/core/widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile_icon.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Alicia Koch',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'alicia.koch@example.com',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 32),
            _buildProfileOption(Icons.person, 'Edit Profile'),
            _buildProfileOption(Icons.settings, 'Settings'),
            _buildProfileOption(Icons.logout, 'Logout', isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {bool isLogout = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800, width: 1),
      ),
      child: Row(
        children: [
          Icon(icon, color: isLogout ? Colors.red : Colors.white),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              color: isLogout ? Colors.red : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          if (!isLogout)
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        ],
      ),
    );
  }
}
