import 'package:flutter/cupertino.dart';
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
            ListTile(
              title: const Text("로그아웃 하기"),
              textColor: Colors.red,
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text("정말 로그아웃 하시겠습니까?"),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("아니요"),
                      ),
                      CupertinoDialogAction(
                        onPressed: () {},
                        isDestructiveAction: true,
                        child: const Text("네"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
