import 'package:flutter/material.dart';
import 'package:oduck/config/theme.dart';

class ActionButton extends StatelessWidget {
  final double bottom;
  final Function function;
  final Color backgroundColor;
  final Icon icon;

  const ActionButton({
    super.key,
    required this.bottom,
    required this.function,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: 10,
      child: FloatingActionButton(
        onPressed: () => function(),
        foregroundColor: primaryColor,
        backgroundColor: backgroundColor,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 버튼 모서리 둥글기
        ), // 그림자 크기
        child: icon,
      ),
    );
  }
}
