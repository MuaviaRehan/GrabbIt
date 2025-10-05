import 'package:classico/components/my_drawertile.dart';
import 'package:classico/pages/settings_page.dart';
import 'package:classico/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout() async {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          // home list title
          MyDrawertile(
              onTap: () => Navigator.pop(context),
              icon: Icons.home,
              text: "H O M E"),

          // setting list titile
          MyDrawertile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
              icon: Icons.settings,
              text: "S E T T I N G S"),
          const Spacer(),
          // logout list title
          MyDrawertile(
            onTap: () {
              logout();
              Navigator.pop(context);
            },
            icon: Icons.logout,
            text: "L O G  O U T",
          ),

          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
