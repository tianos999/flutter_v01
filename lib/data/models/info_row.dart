import 'package:flutter/material.dart';
import 'package:snack_cart/core/utils/utils_mixin.dart';

class InfoRow extends StatelessWidget with UtilsMixin {

  final IconData icon;
  final String label;
  final String value;
  final bool bold;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFFFF8718),
          size: 28,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black.withOpacity(.8),
              fontSize: 16,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontWeight: bold ? FontWeight.bold : FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}