import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oduck/features/profile/view_model/darkMode_view_model.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: ListView(
          children: [
            SwitchListTile.adaptive(
              value: ref.watch(darkModeProvider).darkmode,
              onChanged: (value) => {
                ref.read(darkModeProvider.notifier).setDarkMode(value),
              },
              title: const Text("다크모드"),
            ),
          ],
        ),
      ),
    );
  }
}
