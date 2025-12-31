class Transaction {
  final String id;
  final String title;
  final String description;
  final double amount;
  final bool isPositive;
  final String timeAgo;
  final String type;

  Transaction({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.isPositive,
    required this.timeAgo,
    required this.type,
  });

  static List<Transaction> get sampleTransactions => [
        Transaction(
          id: '1',
          title: 'Deposit',
          description: 'From Bank Transfer',
          amount: 156.89,
          isPositive: true,
          timeAgo: '2 hours ago',
          type: 'deposit',
        ),
        Transaction(
          id: '2',
          title: 'Withdrawal',
          description: 'To Bank Account',
          amount: 105.89,
          isPositive: false,
          timeAgo: '5 hours ago',
          type: 'withdrawal',
        ),
        Transaction(
          id: '3',
          title: 'Deposit',
          description: 'From Card',
          amount: 56.00,
          isPositive: true,
          timeAgo: '1 day ago',
          type: 'deposit',
        ),
      ];
}

class ProfitLossItem {
  final String pair;
  final String name;
  final double value;
  final bool isPositive;
  final double percentage;

  ProfitLossItem({
    required this.pair,
    required this.name,
    required this.value,
    required this.isPositive,
    required this.percentage,
  });

  static List<ProfitLossItem> get sampleItems => [
        ProfitLossItem(
          pair: 'RTS100',
          name: 'RTS Index',
          value: 200.00,
          isPositive: true,
          percentage: 2.5,
        ),
        ProfitLossItem(
          pair: 'USD/CAD',
          name: 'US Dollar / Canadian Dollar',
          value: -244.00,
          isPositive: false,
          percentage: -1.8,
        ),
        ProfitLossItem(
          pair: 'LTC/USD',
          name: 'Litecoin / US Dollar',
          value: 56.00,
          isPositive: true,
          percentage: 1.2,
        ),
      ];
}
