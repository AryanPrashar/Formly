import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Column(children: [
        _Tile('Account'),
        _Tile('Notifications'),
        _Tile('Privacy'),
        _Tile('About'),
      ]),
    );
  }
}

class _Tile extends StatelessWidget {
  final String title;
  const _Tile(this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
