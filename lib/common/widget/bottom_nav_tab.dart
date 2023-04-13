import 'package:flutter/material.dart';
import 'package:oduck/config/theme.dart';

class BottomNavTab extends StatelessWidget {
  const BottomNavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.selectedIndex,
  });

  final String text;
  final bool isSelected;
  final IconData icon;

  final Function onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? primaryColor : null,
              size: 30,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? primaryColor : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
