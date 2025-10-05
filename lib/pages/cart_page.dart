import 'package:classico/components/my_button.dart';
import 'package:classico/components/my_carttile.dart';
import 'package:classico/models/restaurant.dart';
import 'package:classico/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;
        return Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
            centerTitle: true ,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("Are to want to clear the cart"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("cancel")),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    restaurant.clearCart();
                                  },
                                  child: Text("yes"),
                                )
                              ],
                            ));
                  },
                  icon: Icon(Icons.delete))
            ],
          ),
          body: Column(
            children: [
userCart.isEmpty? Expanded(child: Center(child: Text("Cart is empty.."))) : Expanded(
                  child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder: (context, index) {
                        final cartItem = userCart[index];

                        return MyCarttile(cartItem: cartItem);
                      })),
            // button to pay
           MyButton(text: "Go to checkout",
            onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()
            
           )), ),
           SizedBox(height: 25,)
            ],
          ),
        );
      },
    );
  }
}
