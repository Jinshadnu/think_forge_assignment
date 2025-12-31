import 'package:flutter/material.dart';
import 'package:think_forge_assesment/core/features/dashboard/presentation/screens/overall_pl_screen.dart';
import 'package:think_forge_assesment/core/features/splash/splash_screen.dart';
import 'package:think_forge_assesment/core/features/wallet/screens/all_transaction_screen.dart';
import 'package:think_forge_assesment/core/features/wallet/screens/wallet_transfer_screen.dart';
import 'package:think_forge_assesment/navigation/main_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String main = 'main';
  static const String dashboard = '/dashboard';
  static const String wallet = '/wallet';
  static const String transactions = '/transactions';
  static const String profile = '/profile';
  static const String allTransaction = '/allTransaction';
  static const String overallPl = '/overallPl';
  static const String walletTransaction = '/walletTransaction';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case allTransaction:
        return MaterialPageRoute(builder: (_) => const AllTransactionScreen());
      case overallPl:
        return MaterialPageRoute(builder: (_) => const OverallPlScreen());
      case walletTransaction:
        return MaterialPageRoute(builder: (_) => const WalletTransferScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
