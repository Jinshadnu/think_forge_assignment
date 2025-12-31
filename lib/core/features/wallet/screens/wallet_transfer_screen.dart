import 'package:flutter/material.dart';
import 'package:think_forge_assesment/core/theme/app_colors.dart';

class WalletTransferScreen extends StatelessWidget {
  const WalletTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Enter Amonunt to be transferred',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 16),
            const TextField(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '\$2000',
                hintStyle: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Converted value will be 1,77,371.80 INR',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 24),
            _buildNoteField(),
            const SizedBox(height: 24),
            _buildRecipientWallet(),
            const SizedBox(height: 24),
            _buildAccountTransfer(),
            const SizedBox(height: 32),
            _buildTransferDetails(),
          ],
        ),
      ),
      bottomNavigationBar: _buildSwipeToTransfer(),
    );
  }

  Widget _buildNoteField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Type Note to be sent (Optional)',
        hintStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(Icons.note_alt_outlined, color: Colors.white70),
        filled: true,
        fillColor: AppColors.cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildRecipientWallet() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Select Recipient wallet', style: TextStyle(color: Colors.white)),
          Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildAccountTransfer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAccountCard('Your Account', 'Alicia Koch', 'assets/images/profile_icon.jpg'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Icon(Icons.arrow_forward, color: Colors.white),
        ),
        _buildAccountCard('WLT 287292', 'James McGee', 'assets/images/profile_icon.jpg'),
      ],
    );
  }

  Widget _buildAccountCard(String title, String name, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildTransferDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildDetailRow('Type', 'MTS Transfer'),
          _buildDetailRow('Sender ID', 'WLT-2929292'),
          _buildDetailRow('Recipient ID', 'WLT-9829653'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70, fontSize: 14)),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildSwipeToTransfer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.arrow_forward, color: Colors.black),
            Text('Swipe to Transfer', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(width: 24), // For spacing
          ],
        ),
      ),
    );
  }
}
