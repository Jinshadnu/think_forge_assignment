import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class WalletProvider extends ChangeNotifier {
  double balance = 5231.89;

  final transactions = [
    {'title': 'Wallet Deposit', 'amount': '+\$122.00', 'status': 'Approved'},
    {'title': 'Wallet Withdraw', 'amount': '-\$212.00', 'status': 'Approved'},
  ];
}
