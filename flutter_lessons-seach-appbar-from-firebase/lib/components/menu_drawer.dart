import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: UserAccountsDrawerHeader(
              currentAccountPicture: Container(
                alignment: Alignment.topLeft,
                child: const CircleAvatar(
                  backgroundImage: AssetImage("images/monkey.png"),
                ),
              ),
              accountName: const Text("Dragon"),
              accountEmail: const Text("asdfasf"),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15)),
              otherAccountsPictures: [
                IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/');
                    })
              ],
            ),
          ),
          ListTile(
            title: const Text("Settings"),
            leading: const Icon(Icons.settings),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Shop"),
            leading: const Icon(Icons.shop),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Info"),
            leading: const Icon(Icons.info),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
