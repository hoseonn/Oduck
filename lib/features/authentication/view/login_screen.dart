import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
