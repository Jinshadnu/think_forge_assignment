import 'package:flutter/material.dart';
import 'package:think_forge_assesment/core/features/dashboard/domain/models/transaction_model.dart';

class DashboardProvider extends ChangeNotifier {
  // UI State
  bool _isExpanded = false;
  int _selectedTimeFilter = 0; // 0: 1D, 1: 1W, 2: 1M, 3: 1Y, 4: ALL

  // Data
  final List<Transaction> _recentTransactions = Transaction.sampleTransactions;
  final List<ProfitLossItem> _profitLossItems = ProfitLossItem.sampleItems;

  // Getters
  bool get isExpanded => _isExpanded;
  int get selectedTimeFilter => _selectedTimeFilter;
  List<Transaction> get recentTransactions => _recentTransactions;
  List<ProfitLossItem> get profitLossItems => _profitLossItems;

  // Total balance
  double get totalBalance => 5231.89;

  // Toggle expanded state for P/L section
  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  // Update selected time filter
  void setTimeFilter(int index) {
    _selectedTimeFilter = index;
    // Here you would typically fetch new data based on the selected time filter
    notifyListeners();
  }

  // Get profit/loss total
  double get profitLossTotal {
    return _profitLossItems.fold<double>(
      0,
      (double sum, ProfitLossItem item) => sum + item.value,
    );
  }

  // Get total deposit amount
  double get totalDeposits {
    return _recentTransactions
        .where((Transaction tx) => tx.isPositive)
        .fold<double>(
          0,
          (double sum, Transaction tx) => sum + tx.amount,
        );
  }

  // Get total withdrawal amount
  double get totalWithdrawals {
    return _recentTransactions
        .where((Transaction tx) => !tx.isPositive)
        .fold<double>(
          0,
          (double sum, Transaction tx) => sum + tx.amount,
        );
  }
}
