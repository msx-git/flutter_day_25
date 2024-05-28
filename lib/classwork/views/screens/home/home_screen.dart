import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_25/classwork/views/screens/settings/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: DrawerHeader(
          child: Column(
            children: [
              const Text('Menyu'),
              ListTile(
                onTap: () =>
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(
                      builder: (context) => const HomeScreen(),
                    )),
                title: const Text('Home'),
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () =>
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(
                  builder: (context) => const SettingsScreen(),
                )),
                title: const Text('Settings'),
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
              )
            ],
          ),
        ),
      ),
      body: const Center(),
    );
  }
}
