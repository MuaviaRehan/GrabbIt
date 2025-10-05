import 'package:classico/models/cart_item.dart';
import 'package:classico/models/food.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:intl/intl.dart'; // zaroori import

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // Burgers
    Food(
        name: "Aloha Burger",
        description:
            "A juicy patty with melted cheddar, lettuce, tomato and a hint of onion and pickle",
        imagePath: 'assets/images/burgers/1.png',
        price: 0.99,
        category: FoodCategory.Burgers,
        availableAddons: [
          Addon(name: "Avocado", price: 1.99),
          Addon(name: "Extra cheese", price: 0.99),
          Addon(name: "Bacon", price: 3.99),
        ]),
    Food(
        name: "Classy Cheesburger",
        description:
            "A juicy patty with melted cheddar, lettuce, tomato and a hint of onion and pickle",
        imagePath: 'assets/images/burgers/4.png',
        price: 0.99,
        category: FoodCategory.Burgers,
        availableAddons: [
          Addon(name: "Avocado", price: 1.99),
          Addon(name: "Extra cheese", price: 0.99),
          Addon(name: "Bacon", price: 3.99),
        ]),
    Food(
      name: "BBQ Bacon Burger",
      description:
          "Smoky BBQ sauce, crispy onion rings, melted cheese, and a beef patty.",
      imagePath: 'assets/images/burgers/2.png',
      price: 1.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra BBQ Sauce", price: 0.49),
        Addon(name: "Jalapeños", price: 0.79),
        Addon(name: "Double Patty", price: 2.49),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A wholesome veggie patty with lettuce, tomato, and vegan mayo.",
      imagePath: 'assets/images/burgers/5.png',
      price: 1.29,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Avocado", price: 1.29),
        Addon(name: "Vegan Cheese", price: 1.49),
        Addon(name: "Grilled Mushrooms", price: 0.99),
      ],
    ),
    Food(
      name: "Spicy Jalapeño Burger",
      description:
          "A fiery beef patty with jalapeños, pepper jack cheese, and spicy aioli.",
      imagePath: 'assets/images/burgers/3.png',
      price: 1.79,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Jalapeños", price: 0.69),
        Addon(name: "Chipotle Sauce", price: 0.79),
        Addon(name: "Double Cheese", price: 1.29),
      ],
    ),

    // salads
    Food(
      name: "Asian Sesame Salad",
      description:
          "Fresh lettuce, shredded carrots, cabbage, and cucumbers topped with crispy noodles and sesame dressing.",
      imagePath: 'assets/images/salads/1.png',
      price: 2.49,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 2.99),
        Addon(name: "Tofu", price: 1.99),
        Addon(name: "Extra Sesame Dressing", price: 0.79),
      ],
    ),
    Food(
      name: "Caesar Salad",
      description:
          "Crisp romaine lettuce, parmesan cheese, crunchy croutons, and creamy Caesar dressing.",
      imagePath: "assets/images/salads/2.png",
      price: 2.29,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 2.49),
        Addon(name: "Shrimp", price: 3.49),
        Addon(name: "Extra Dressing", price: 0.79),
      ],
    ),
    Food(
      name: "Southwest Salad",
      description:
          "A bold mix of lettuce, black beans, corn, tomatoes, cheese, and tortilla strips with chipotle dressing.",
      imagePath: "assets/images/salads/3.png",
      price: 2.59,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Avocado", price: 1.49),
        Addon(name: "Grilled Chicken", price: 2.49),
        Addon(name: "Extra Tortilla Strips", price: 0.59),
      ],
    ),
    Food(
      name: "Quinoa Salad",
      description:
          "Healthy quinoa with cucumbers, cherry tomatoes, bell peppers, and lemon herb dressing.",
      imagePath: "assets/images/salads/4.png",
      price: 2.99,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Feta Cheese", price: 1.29),
        Addon(name: "Grilled Tofu", price: 1.99),
        Addon(name: "Extra Lemon Dressing", price: 0.79),
      ],
    ),
    Food(
      name: "Greek Salad",
      description:
          "A refreshing mix of cucumbers, tomatoes, red onions, olives, and feta cheese with olive oil dressing.",
      imagePath: "assets/images/salads/5.png",
      price: 2.49,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Extra Feta", price: 1.49),
        Addon(name: "Pita Bread", price: 0.99),
        Addon(name: "Grilled Chicken", price: 2.49),
      ],
    ),

    // sides
    Food(
      name: "Garlic Bread",
      description:
          "Warm, crispy bread topped with buttery garlic spread and herbs.",
      imagePath: "assets/images/sides/1.png",
      price: 1.49,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.79),
        Addon(name: "Marinara Dip", price: 0.59),
        Addon(name: "Spicy Butter", price: 0.69),
      ],
    ),
    Food(
      name: "Loaded Fries",
      description:
          "Golden fries topped with melted cheese, sour cream, and crispy bacon bits.",
      imagePath: "assets/images/sides/2.png",
      price: 2.49,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.79),
        Addon(name: "Jalapeños", price: 0.69),
        Addon(name: "BBQ Sauce", price: 0.59),
      ],
    ),
    Food(
      name: "Mac & Cheese Side",
      description:
          "Creamy, cheesy pasta baked to perfection with a golden crust.",
      imagePath: "assets/images/sides/3.png",
      price: 1.99,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Bacon Crumble", price: 0.99),
        Addon(name: "Extra Cheese", price: 0.79),
        Addon(name: "Truffle Oil", price: 1.29),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Crispy golden onion rings served with tangy dipping sauce.",
      imagePath: "assets/images/sides/4.png",
      price: 1.59,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Ranch Dip", price: 0.59),
        Addon(name: "BBQ Dip", price: 0.59),
        Addon(name: "Spicy Aioli", price: 0.79),
      ],
    ),
    Food(
      name: "Sweet Potato Fries",
      description:
          "Crispy sweet potato fries with a hint of cinnamon and sea salt.",
      imagePath: "assets/images/sides/5.png",
      price: 1.79,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Honey Mustard Dip", price: 0.59),
        Addon(name: "Garlic Aioli", price: 0.79),
        Addon(name: "Cajun Spice", price: 0.49),
      ],
    ),

    // desserts
    Food(
      name: "Oreo Dessert",
      description:
          "Creamy layers of crushed Oreos and chocolate mousse topped with whipped cream.",
      imagePath: "assets/images/desserts/5.png",
      price: 2.99,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Extra Oreos", price: 0.79),
        Addon(name: "Chocolate Drizzle", price: 0.59),
      ],
    ),
    Food(
      name: "Chocolate Lasagna",
      description:
          "Layers of chocolate pudding, whipped cream, and Oreo crust topped with chocolate shavings.",
      imagePath: "assets/images/desserts/6.png",
      price: 3.49,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Extra Chocolate", price: 0.79),
        Addon(name: "Nutella Drizzle", price: 0.99),
      ],
    ),
    Food(
      name: "Strawberry Cake",
      description:
          "Moist strawberry cake topped with fresh strawberries and cream frosting.",
      imagePath: "assets/images/desserts/4.png",
      price: 2.79,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Extra Strawberries", price: 0.79),
        Addon(name: "Vanilla Cream", price: 0.59),
      ],
    ),
    Food(
      name: "Cheesecake",
      description:
          "Classic New York-style cheesecake with a buttery graham cracker crust.",
      imagePath: "assets/images/desserts/3.png",
      price: 3.19,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Strawberry Sauce", price: 0.79),
        Addon(name: "Chocolate Sauce", price: 0.79),
      ],
    ),
    Food(
      name: "Molten Lava Cake",
      description:
          "Warm chocolate cake with a gooey molten center served with vanilla ice cream.",
      imagePath: "assets/images/desserts/1.png",
      price: 3.49,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Extra Ice Cream", price: 1.29),
        Addon(name: "Caramel Sauce", price: 0.79),
      ],
    ),

    // drinks
    Food(
      name: "Berry Blossom Spritz",
      description:
          "A refreshing mix of sparkling water, mixed berries, and a hint of floral essence.",
      imagePath: "assets/images/drinks/1.png",
      price: 1.99,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Extra Berries", price: 0.99),
        Addon(name: "Mint Leaves", price: 0.49),
        Addon(name: "Chia Seeds", price: 0.79),
      ],
    ),
    Food(
      name: "Fig & Spice Winter Elixir",
      description:
          "A cozy blend of fig, cinnamon, and warm spices with a touch of honey.",
      imagePath: "assets/images/drinks/2.png",
      price: 2.49,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Extra Cinnamon", price: 0.39),
        Addon(name: "Whipped Cream", price: 0.79),
        Addon(name: "Honey Drizzle", price: 0.59),
      ],
    ),
    Food(
      name: "Raspberry Lime Refresher",
      description:
          "A zesty refresher with tart raspberries, fresh lime juice, and sparkling water.",
      imagePath: "assets/images/drinks/3.png",
      price: 1.89,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Extra Lime", price: 0.49),
        Addon(name: "Raspberry Syrup", price: 0.79),
        Addon(name: "Mint Garnish", price: 0.39),
      ],
    ),
    Food(
      name: "Sparkling Lemonade",
      description:
          "Classic lemonade elevated with sparkling water and a burst of citrus flavor.",
      imagePath: "assets/images/drinks/4.png",
      price: 1.79,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Extra Lemon Slice", price: 0.29),
        Addon(name: "Mint Leaves", price: 0.49),
        Addon(name: "Ginger Zest", price: 0.69),
      ],
    ),
    Food(
      name: "Smoked Pineapple Mezcal Refresher",
      description:
          "A bold tropical refresher with smoky mezcal notes, grilled pineapple, and a splash of lime.",
      imagePath: "assets/images/drinks/5.png",
      price: 2.99,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Extra Pineapple", price: 0.99),
        Addon(name: "Chili Rim", price: 0.49),
        Addon(name: "Mint Garnish", price: 0.39),
      ],
    ),
  ];

  final List<CartItem> _cart = [];
// delivery address(which user can change update)
String _deliveryAddress ='New karachi';

  // Getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
String get deliveryAddress=> _deliveryAddress ;
  //OPERATIONS

  // user cart

  //ADD TO CART
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there cart tiem already with the same FOOD OR SELECTED ADDONS
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are same
      bool isSameFood = item.food == food;

      // check if the list of selected addos  are same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if otem already exis increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  // REmove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart

  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalitemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

// update delivery address
void updateDeliveryAddress(String newAddress){
_deliveryAddress =newAddress;
notifyListeners();
}

// generate a reciept
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt..");
    receipt.writeln();

    // format the date to include upto seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln();
      }
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total items: ${getTotalitemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
          return receipt.toString() ;

  }

  //format a double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //  Format lsit of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
