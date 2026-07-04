import 'package:flutter/material.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({super.key});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int quantity = 1;
  final double unitPrice = 8;

  @override
  Widget build(BuildContext context) {
    final total = quantity * unitPrice;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFEAE5F4),
        ),
      ),
      child: Row(
        children: [
          // Coffee Icon
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F4FB),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: const Text(
              "☕",
              style: TextStyle(fontSize: 28),
            ),
          ),

          const SizedBox(width: 16),

          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Café",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2F1E56),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "S/ 8 c/u",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8D7BAE),
                  ),
                ),
              ],
            ),
          ),

          // Quantity Controls
          Row(
            children: [
              _QuantityButton(
                icon: Icons.remove,
                onTap: () {
                  if (quantity > 1) {
                    setState(() => quantity--);
                  }
                },
              ),

              SizedBox(
                width: 48,
                child: Center(
                  child: Text(
                    "$quantity",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2F1E56),
                    ),
                  ),
                ),
              ),

              _QuantityButton(
                icon: Icons.add,
                onTap: () {
                  setState(() => quantity++);
                },
              ),
            ],
          ),

          const SizedBox(width: 24),

          // Total Price
          Text(
            "S/${total.toStringAsFixed(0)}",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2F1E56),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xFFD7C9F3),
            width: 2,
          ),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF7B57D1),
          size: 28,
        ),
      ),
    );
  }
}