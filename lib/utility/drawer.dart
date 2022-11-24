import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/mywatchlist_page.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildMenuItems(context),
              ]),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 12,
        children: [
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              // close navigation drawer before
              Navigator.pop(context);
              // Route menu ke halaman form
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // close navigation drawer before
              Navigator.pop(context);
              // Route menu ke halaman data budget
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyDataPage()),
              );
            },
          ),
          ListTile(
            title: const Text('My Watch List'),
            onTap: () {
              // close navigation drawer before
              Navigator.pop(context);
              // Route menu ke halaman data budget
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const MyWatchlistPage()),
              );
            },
          ),
        ],
      ));
}
