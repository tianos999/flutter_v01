import 'package:flutter/material.dart';

class EmployeeRow extends StatelessWidget {
  const EmployeeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.badge_outlined,
          color: Color(0xFFFF8718),
          size: 28,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            "Empleado asignado",
            style: TextStyle(
              color: Colors.black54.withOpacity(.8),
              fontSize: 16,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF7A7B3A),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            "Carrito #07",
            style: TextStyle(
              color: Color(0xFFD9FF8A),
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}