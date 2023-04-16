import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
        left: 10,
        bottom: 5,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "애니플러스",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "@aniplus",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  "소식받기",
                  style: TextStyle(color: primaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "fsdfsdfsdfjsfnnkknjnknjkfnjfnjkfknjfnjkfnjkfjknfkjnfkjnf",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "오전 12:53 2023년 4월 15일",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
