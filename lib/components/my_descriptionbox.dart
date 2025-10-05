import 'package:flutter/material.dart';

class MyDescriptionbox extends StatelessWidget {
  const MyDescriptionbox({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimarytTextStyle =TextStyle(color: Theme.of(context).colorScheme.inversePrimary) ;
    var mySecondaryTextStyle = TextStyle(color: Theme.of(context).colorScheme.primary);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary), borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.only(left: 20, right:20 , bottom: 20),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [Text('\$0.99',style: myPrimarytTextStyle,), Text('Delivery fee',style: mySecondaryTextStyle,)],
          ),
          SizedBox(width: 15,),
          Column(
            children: [Text('15-30 min',style: myPrimarytTextStyle,), Text('Delivery time',style: mySecondaryTextStyle,)],
          )
        ],
      ),
    );
  }
}
