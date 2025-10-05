import 'package:flutter/material.dart';

class MyDrawertile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function()? onTap;

  const MyDrawertile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25),
      child: ListTile(
        title: Text(text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            )),
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),onTap: onTap,
      ),
    );
  }
}
