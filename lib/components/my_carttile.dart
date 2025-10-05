import 'package:classico/components/quantity_selector.dart';
import 'package:classico/models/cart_item.dart';
import 'package:classico/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCarttile extends StatelessWidget {
  final CartItem cartItem;
  const MyCarttile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: colors.secondary, // Deep Purple card background
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row: image + details
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    cartItem.food.imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                // name, price, and quantity
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Food name
                      Text(
                        cartItem.food.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colors.tertiary, // White on purple
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Price
                      Text(
                        '\$${cartItem.food.price}',
                        style: TextStyle(
                          color: colors.tertiary.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Increment / decrement
                      QuantitySelector(
                        food: cartItem.food,
                        quantity: cartItem.quantity,
                        onDecreament: () {
                          restaurant.removeFromCart(cartItem);
                        },
                        onIncreament: () {
                          restaurant.addToCart(
                            cartItem.food,
                            cartItem.selectedAddons,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Addons list
            if (cartItem.selectedAddons.isNotEmpty)
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: cartItem.selectedAddons.map((addon) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(addon.name),
                            const SizedBox(width: 6),
                            Text('\$${addon.price}'),
                          ],
                        ),
                        shape: StadiumBorder(
                          side: BorderSide(color: colors.tertiary), // white border
                        ),
                        onSelected: (_) {},
                        backgroundColor: colors.primary, // Light purple chip
                        labelStyle: TextStyle(
                          color: colors.inversePrimary, // Black text on light purple
                          fontSize: 12,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
