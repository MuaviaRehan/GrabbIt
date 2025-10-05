import 'package:classico/models/food.dart';

class CartItem {
   Food food;
   List<Addon> selectedAddons ;
   int quantity ;
  
  CartItem({
    required this.food,
    required this.selectedAddons,   
    this.quantity =1 ,   
  });

  double get totalPrice{
    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
    double addonsPrice =selectedAddons.fold(0, (sum, Addon)=> sum + Addon.price);
return (food.price +addonsPrice)*quantity;
  }
}