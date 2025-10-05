import 'package:classico/models/food.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncreament;
  final VoidCallback onDecreament;

  const QuantitySelector({
    super.key,
    required this.food,
    required this.quantity,
    required this.onDecreament,
    required this.onIncreament,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // decrease button
          GestureDetector(
            onTap:  onDecreament,
            child: Icon(
              Icons.remove,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          // quantity count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(child: Text(quantity.toString())),
          ),

          // increase button
          GestureDetector(
            onTap: onIncreament,
            child: Icon(
              Icons.add,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
