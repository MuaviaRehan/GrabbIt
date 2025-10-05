import 'package:classico/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyLocation extends StatelessWidget {
  MyLocation({super.key});

  // controller for the text field
  final TextEditingController textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text("Your Location",style: GoogleFonts.poppins()),
        content: TextField(
          controller: textController, 
          decoration: const InputDecoration(hintText: "Enter your Address.."),
        ),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear(); 
            },
            child:  Text("cancel",style: GoogleFonts.poppins()),
          ),

          // save button
          MaterialButton(
            onPressed: () {
              String newAddress = textController.text.trim();
              if (newAddress.isNotEmpty) {
                context.read<Restaurant>().updateDeliveryAddress(newAddress);
              }
              Navigator.pop(context);
              textController.clear(); 
            },
            child:  Text("save",style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: GoogleFonts.poppins(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAddress,
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
