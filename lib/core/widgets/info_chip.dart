// lib/core/widgets/info_chip.dart
import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final String value;
  final bool isPositive;

  const InfoChip({
    Key? key,
    required this.label,
    required this.value,
    required this.isPositive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isPositive
            ? Colors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPositive ? Icons.arrow_upward : Icons.arrow_downward,
            size: 14,
            color: isPositive ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 4),
          Text(
            '$label: $value',
            style: TextStyle(
              color: isPositive ? Colors.green : Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
