import 'package:flutter/material.dart';
import 'package:think_forge_assesment/core/features/dashboard/presentation/widgets/marquee_widget.dart';

class MarqueeScreen extends StatelessWidget {
  const MarqueeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade500,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: const Marquee(
        text: 'Withdrawals • Secure Trading Wallet • Instant Deposits • Fast Withdrawals • ',
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
