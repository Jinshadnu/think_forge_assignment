import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_forge_assesment/core/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:think_forge_assesment/core/features/profile/profile_screen.dart';
import 'package:think_forge_assesment/core/features/transactions/transaction_screen.dart';
import 'package:think_forge_assesment/core/features/wallet/screens/wallet_screen.dart';
import 'package:think_forge_assesment/core/widgets/bottom_nav.dart';
import 'package:think_forge_assesment/navigation/bottom_nav_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final index = context.watch<BottomNavProvider>().index;

    final screens = const [
      DashboardScreen(),
      WalletScreen(),
      TransactionsScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: screens,
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}
