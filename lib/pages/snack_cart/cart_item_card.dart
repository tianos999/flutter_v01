import 'package:flutter/material.dart';
import 'package:snack_cart/core/utils/utils_mixin.dart';
import 'package:snack_cart/data/models/topping.dart';

class CartItemCard extends StatefulWidget {

  final Topping topping;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.topping,
    required this.onRemove,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> with UtilsMixin {

  int quantity = 1;
  late final double unitPrice = widget.topping.price;

  @override
  Widget build(BuildContext context) {

    final total = quantity * unitPrice;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFEAE5F4),
        ),
      ),
      child: Row(
        children: [

          // Coffee Icon
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F4FB),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Icon(
              widget.topping.icon,
              color: widget.topping.color,
              size: 28,
            ),
          ),

          SizedBox(width: 16),

          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.topping.name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2F1E56),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "S/ ${widget.topping.price.toStringAsFixed(1)} c/u",
                  style: TextStyle(
                    fontSize: 13,
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
                  } else if (quantity == 1) {
                    widget.onRemove();
                  }
                },
              ),

              SizedBox(
                width: 30,
                child: Center(
                  child: Text(
                    "$quantity",
                    style: const TextStyle(
                      fontSize: 18,
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

          SizedBox(width: 12),

          // Total Price
          Text(
            "S/${total.toStringAsFixed(0)}",
            style: const TextStyle(
              fontSize: 18,
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
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFD7C9F3),
            width: 2,
          ),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF7B57D1),
          size: 25,
        ),
      ),
    );
  }
}