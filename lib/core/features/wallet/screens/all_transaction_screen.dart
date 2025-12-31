import 'package:flutter/material.dart';
import 'package:think_forge_assesment/app/routes/app_routes.dart';
import 'package:think_forge_assesment/core/theme/app_colors.dart';
import 'package:think_forge_assesment/core/widgets/custom_app_bar.dart';
import 'package:think_forge_assesment/core/widgets/transaction_details_bottom_sheet.dart';

class AllTransactionScreen extends StatelessWidget {
  const AllTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchAndFilter(),
            const SizedBox(height: 24),
            _buildTransactionList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Transactions',
              hintStyle: TextStyle(color: Colors.grey.shade400),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
              filled: true,
              fillColor: AppColors.cardColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.filter_list, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildTransactionList(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          _buildDateHeader('November 30th, 2025'),
          _buildTransactionItem(
            context,
            icon: Icons.account_balance_wallet,
            color: Colors.green,
            title: 'Wallet deposit',
            date: '23rd may 2025',
            status: 'Approved',
            statusColor: Colors.green,
            amount: '+\$21,282',
            amountColor: Colors.green,
          ),
          _buildTransactionItem(
            context,
            icon: Icons.wallet,
            color: Colors.red,
            title: 'Wallet Withdraw',
            date: '23rd may 2025',
            status: 'Approved',
            statusColor: Colors.green,
            amount: '-\$21,282',
            amountColor: Colors.red,
          ),
          _buildTransactionItem(
            context,
            icon: Icons.group,
            color: Colors.purple,
            title: 'Referrel',
            date: '23rd may 2025',
            status: 'Approved',
            statusColor: Colors.green,
            amount: '+\$21,282',
            amountColor: Colors.green,
          ),
          _buildTransactionItem(
            context,
            icon: Icons.star,
            color: Colors.orange,
            title: 'Bonus',
            date: '23rd may 2025',
            status: 'Approved',
            statusColor: Colors.green,
            amount: '+\$21,282',
            amountColor: Colors.green,
          ),
          _buildTransactionItem(
            context,
            icon: Icons.account_balance_wallet,
            color: Colors.green,
            title: 'Wallet deposit',
            date: '23rd may 2025',
            status: 'Rejected',
            statusColor: Colors.red,
            amount: '+\$21,282',
            amountColor: Colors.green,
          ),
          _buildDateHeader('November 29th, 2025'),
          _buildTransactionItem(
            context,
            icon: Icons.account_balance_wallet,
            color: Colors.green,
            title: 'Wallet deposit',
            date: '23rd may 2025',
            status: 'Approved',
            statusColor: Colors.green,
            amount: '+\$21,282',
            amountColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildDateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        date,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTransactionItem(
    BuildContext context,
    {
    required IconData icon,
    required Color color,
    required String title,
    required String date,
    required String status,
    required Color statusColor,
    required String amount,
    required Color amountColor,
  }) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const TransactionDetailsBottomSheet(),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1C2632),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(date, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            Row(
              children: [
                Text(status, style: TextStyle(color: statusColor, fontSize: 14)),
                const SizedBox(width: 16),
                Text(amount,
                    style: TextStyle(
                        color: amountColor, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
