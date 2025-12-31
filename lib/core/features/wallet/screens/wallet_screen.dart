import 'package:flutter/material.dart';
import 'package:think_forge_assesment/app/routes/app_routes.dart';
import 'package:think_forge_assesment/core/theme/app_colors.dart';
import 'package:think_forge_assesment/core/widgets/custom_app_bar.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWalletBalanceCard(),
            const SizedBox(height: 24),
            _buildActionButtons(),
            const SizedBox(height: 32),
            _buildMyMt5Accounts(),
            const SizedBox(height: 32),
            _buildTotalTransactionsOverview(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletBalanceCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Your Balance',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
        ),
        SizedBox(height: 8),
        Text(
          '\$5,231.89',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Unassigned amount in wallet : \$345.09',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.account_balance_wallet, size: 18),
            label: const Text('Deposit'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.arrow_upward, size: 18),
            label: const Text('Withdraw'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              side: BorderSide(color: Colors.grey.shade700),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.swap_horiz, size: 18),
            label: const Text('Transfer'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              side: BorderSide(color: Colors.grey.shade700),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const Icon(Icons.more_horiz, color: Colors.white),
      ],
    );
  }

  Widget _buildMyMt5Accounts() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('My MT5 Accounts'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildMt5Card('Demo', 'MT51192', '+\$5,325.57', false)),
              const SizedBox(width: 16),
              Expanded(child: _buildMt5Card('Live', 'MT51192', '+\$5,325.57', true)),
            ],
          ),
          const SizedBox(height: 32),
          _buildMyBankAccounts(),
          const SizedBox(height: 32),
          _buildMyCryptoAddresses()
        ],
      ),
    );
  }

  Widget _buildMt5Card(String type, String id, String balance, bool isLive) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2632),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(type, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              if (isLive)
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(id, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
          const SizedBox(height: 8),
          Text(balance, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTotalTransactionsOverview(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Transactions Overview',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _buildTransactionItem(
            icon: Icons.account_balance_wallet,
            color: Colors.green,
            title: 'Wallet deposit',
            date: '23rd may 2025',
            status: 'Approved',
            statusColor: Colors.green,
            amount: '+\$21,282',
            amountColor: Colors.green,
          ),
          const SizedBox(height: 16),
          _buildTransactionItem(
            icon: Icons.wallet,
            color: Colors.red,
            title: 'Wallet Withdraw',
            date: '23rd may 2025',
            status: 'Approved',
            statusColor: Colors.green,
            amount: '-\$21,282',
            amountColor: Colors.red,
          ),
          const SizedBox(height: 16),
          _buildTransactionItem(
            icon: Icons.group,
            color: Colors.purple,
            title: 'Referrel',
            date: '23rd may 2025',
            status: 'Approved',
            statusColor: Colors.green,
            amount: '+\$21,282',
            amountColor: Colors.green,
          ),
          const SizedBox(height: 16),
          _buildTransactionItem(
            icon: Icons.star,
            color: Colors.orange,
            title: 'Bonus',
            date: '23rd may 2025',
            status: 'Approved',
            statusColor: Colors.green,
            amount: '+\$21,282',
            amountColor: Colors.green,
          ),
          const SizedBox(height: 16),
          _buildTransactionItem(
            icon: Icons.account_balance_wallet,
            color: Colors.green,
            title: 'Wallet deposit',
            date: '23rd may 2025',
            status: 'Rejected',
            statusColor: Colors.red,
            amount: '+\$21,282',
            amountColor: Colors.green,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.allTransaction);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('View All'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required Color color,
    required String title,
    required String date,
    required String status,
    required Color statusColor,
    required String amount,
    required Color amountColor,
  }) {
    return Container(
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
    );
  }

  Widget _buildMyBankAccounts() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('My Bank Accounts'),
          const SizedBox(height: 16),
          SizedBox(
            height: 100, // Adjust height as needed
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildBankAccountCard('Axis Bank', '5375 **** **** 2368', 'India', true),
                const SizedBox(width: 16),
                _buildBankAccountCard('ICICI', '5375 **** **** 2368', 'India', false),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBankAccountCard(String bankName, String accNumber, String country, bool isPending) {
    return Container(
      width: 180, // Adjust width as needed
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPending ? Colors.green.shade800.withOpacity(0.5) : Colors.blue.shade800.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(bankName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Text(accNumber, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(country, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              if (isPending) const Text('Pending', style: TextStyle(color: Colors.yellow, fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMyCryptoAddresses() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('My Crypto Address'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildCryptoCard('TRC20', 'TQ9aC9...Lx3p9z')),
              const SizedBox(width: 16),
              Expanded(child: _buildCryptoCard('TRC20', '0x4e9c...d28a67')),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCryptoCard(String type, String address) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2632),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(type, style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(address, style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
