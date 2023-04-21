import 'package:flutter/material.dart';
import 'package:zoom/presentation/cubits/auth_cubit/auth_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          actions: [
            IconButton(
                onPressed: () {
                  AuthCubit.read(context).signOut();
                },
                icon: const Icon(Icons.output))
          ],
        ),
        body: const Center(
          child: Text('Coming soon...'),
        ));
  }
}
