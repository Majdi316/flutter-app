import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text("m.hoseen@student.aaup.edu"),
            accountName: Text("majdi hoseen"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/accoun image.jfif"),
                    fit: BoxFit.fill)),
          ),
          ListTile(
            title: const Text(
              "Home Page",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
            ),
            leading: const Icon(
              Icons.home,
              size: 30,
            ),
            onTap: () {
              Navigator.of(context).pushNamed("homePage");
            },
          ),
          ListTile(
            title: const Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
            leading: const Icon(
              Icons.category,
              size: 30,
            ),
            onTap: () {
              Navigator.of(context).pushNamed("categories");
            },
          ),
          ListTile(
            title: const Text(
              "Logout",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
            ),
            leading: const Icon(
              Icons.logout,
              size: 30,
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .restorablePushNamedAndRemoveUntil("login", (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
