import 'package:flutter/cupertino.dart';

class FieldDetail extends StatelessWidget {
  final String label;
  final Widget child;

  const FieldDetail({
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xff6D6791),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffE7E0F0)),
            borderRadius: BorderRadius.circular(18),
          ),
          child: child,
        )
      ],
    );
  }
}