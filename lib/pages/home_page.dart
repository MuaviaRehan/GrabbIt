import 'package:classico/components/my_descriptionbox.dart';
import 'package:classico/components/my_drawer.dart';
import 'package:classico/components/my_food.dart';
import 'package:classico/components/my_foodtile.dart';
import 'package:classico/components/my_location.dart';
import 'package:classico/components/my_silver_appbar.dart';
import 'package:classico/components/my_tabbar.dart';
import 'package:classico/models/food.dart';
import 'package:classico/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Filter menu by category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // Return list of widgets displaying food in each category
  List<Widget> _getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // iss category ka food filter karo
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      // tab ke andar ek list banao
      return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: categoryMenu.length,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return MyFoodtile(
            ontap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyFood(food: food))),
            food: food,
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppbar(
            title: MyTabbar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                // my current location
                MyLocation(),
                // description box
                MyDescriptionbox(),
              ],
            ),
          )
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) {
            return TabBarView(
              controller: _tabController,
              children: _getFoodInThisCategory(restaurant.menu),
            );
          },
        ),
      ),
    );
  }
}
