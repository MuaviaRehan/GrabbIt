import 'package:classico/models/food.dart';
import 'package:flutter/material.dart';

class MyTabbar extends StatelessWidget {
  final TabController tabController;
  const MyTabbar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    // ignore: non_constant_identifier_names
    return FoodCategory.values.map((Category) {
      return Tab(
        text: Category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(controller: tabController, tabs: _buildCategoryTabs(),);
  }
}
