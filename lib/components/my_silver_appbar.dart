import 'package:classico/pages/cart_page.dart';
import 'package:flutter/material.dart';

class MySilverAppbar extends StatelessWidget {
  final Widget title;
  final Widget child;
  const MySilverAppbar({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      floating: false,
      pinned: true,
      collapsedHeight: 120,
      title: Center(child: Text("GrabbIt")),
      actions: [IconButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),));
      }, icon: Icon(Icons.shopping_cart,color: Theme.of(context).colorScheme.secondary,))],
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      backgroundColor: Theme.of(context).colorScheme.surface,
      flexibleSpace: FlexibleSpaceBar(
background: Padding(padding: EdgeInsets.all(43  ), child: child,),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
