import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oduck/features/profile/view_model/darkMode_view_model.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Column(
              children: const [
                CircleAvatar(
                  radius: 90,
                  foregroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwmVE8Ep8HFFzwble3NCWLT0KAIs5kclv_AA&usqp=CAU",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "호선호선",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const ListTile(
              // onTap: _onActivityTap,
              title: Text(
                "구독 관리",
              ),
              trailing: Icon(Ionicons.chevron_forward_outline),
            ),
            SwitchListTile.adaptive(
              value: ref.watch(darkModeProvider).darkmode,
              onChanged: (value) => {
                ref.read(darkModeProvider.notifier).setDarkMode(value),
              },
              title: const Text("다크모드 켜기"),
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
