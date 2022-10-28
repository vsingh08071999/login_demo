import 'package:flutter/material.dart';
import 'package:login_demo/screens/myAccount_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('My Account'),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAccountScreen()));
            },
          ),
          ListTile(
            title: const Text('Setting'),
            leading: Icon(Icons.settings),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
