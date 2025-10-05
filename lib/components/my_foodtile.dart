import 'package:classico/models/food.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFoodtile extends StatelessWidget {
  final Food food;
  final void Function()? ontap;
  const MyFoodtile({super.key, required this.ontap, required this.food});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              
              children: [
                // TEXT FOOD DETAILS
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.name,style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                    ),),
                    Text(
                      '\$${food.price}',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(food.description,style: GoogleFonts.poppins(),),
                  ],
                )),
                SizedBox(height: 15,),
                // food image
               ClipRRect(
                borderRadius:  BorderRadius.circular(8),
                child: Image.asset(food.imagePath, height: 120,),
               )
                
              ],
              
            ),
          ),
        ),
        Divider(color: Theme.of(context).colorScheme.tertiary  ,endIndent: 25,
        indent: 25,)
      ],
    );
  }
}
