import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network('https://avatars.githubusercontent.com/u/77233531?v=4'),
            ),
            accountName: Text('Tony'),
            accountEmail: Text('tony@mail.com'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Home'),
            subtitle: const Text('Tela inicial'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: const Text('Tela 2'),
            subtitle: const Text('Incrementar'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/tela1');
            },
          ),
        ],
      ),
    );
  }
}
