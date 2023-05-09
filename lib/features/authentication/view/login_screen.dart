import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/social_login_view_model.dart';

class LoginScreen extends ConsumerWidget {
  static String routeName = "login";
  static String routeURL = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            children: [
              const Text(
                "오덕에 어서오세요!",
                // style: TextStyle(color: ),
              ),
              GestureDetector(
                onTap: () =>
                    ref.read(socialAuthProvider.notifier).googleSignIn(context),
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/googleLogo.png',
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "구글로 시작하기",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
