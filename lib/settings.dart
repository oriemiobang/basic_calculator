import 'package:basic_calculator/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SafeArea(
        child: Consumer<UiProvider>(
          builder: (context, UiProvider notifier, child) {
            return Padding(
              child: Column(children: [
                ListTile(
                  leading: Icon(
                      notifier.isDark ? Icons.dark_mode : Icons.light_mode),
                  title: Text('Dark Theme'),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      onChanged: (value) => notifier.changeTheme(),
                      value: notifier.isDark,
                    ),
                  ),
                ),
              ]),
              padding: EdgeInsets.all(10),
            );
          },
        ),
      ),
    );
  }
}
