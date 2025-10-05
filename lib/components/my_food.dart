import 'package:classico/components/my_button.dart';
import 'package:classico/models/food.dart';
import 'package:classico/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFood extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  MyFood({super.key, required this.food}) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<MyFood> createState() => _MyFoodState();
}

class _MyFoodState extends State<MyFood> {
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);

    // selected addons list banao
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    // add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Food image top half
                SizedBox(
                  height: screenHeight * 0.4,
                  width: double.infinity,
                  child: Image.asset(
                    widget.food.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(
                        widget.food.name,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: colors.inversePrimary, // dark text on light bg
                        ),
                      ),
                      const SizedBox(height: 4),

                      // food price
                      Text(
                        '\$${widget.food.price}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: colors.primary, // light purple highlight
                        ),
                      ),

                      const SizedBox(height: 16),

                      // food description
                      Text(
                        widget.food.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),

                      const SizedBox(height: 16),
                      Divider(color: colors.primary.withOpacity(0.4)),

                      const SizedBox(height: 12),

                      // Add-ons title
                      Text(
                        "Add-ons",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colors.inversePrimary,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Addons list
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.primary),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            final addon = widget.food.availableAddons[index];

                            return CheckboxListTile(
                              title: Text(
                                addon.name,
                                style: TextStyle(color: colors.inversePrimary),
                              ),
                              subtitle: Text(
                                '\$${addon.price}',
                                style: TextStyle(
                                  color: colors.primary,
                                  fontSize: 13,
                                ),
                              ),
                              activeColor: colors.secondary, // deep purple check
                              checkColor: colors.tertiary,  // white tick
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Add to Cart button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: MyButton(
                    text: "Add to Cart",
                    onTap: () => addToCart(widget.food, widget.selectedAddons),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),

        // Back button (circle)
        SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colors.secondary.withOpacity(0.8), 
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new_rounded,
                  color: colors.tertiary),
            ),
          ),
        ),
      ],
    );
  }
}
