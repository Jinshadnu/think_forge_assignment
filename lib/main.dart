import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_forge_assesment/app/routes/app_routes.dart';
import 'package:think_forge_assesment/core/features/dashboard/presentation/provider/dashboard_provider.dart';
import 'package:think_forge_assesment/navigation/bottom_nav_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
