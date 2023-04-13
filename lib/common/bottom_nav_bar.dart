import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oduck/features/map/view/map_screen.dart';
import 'package:oduck/features/profile/profile_screen.dart';

import 'widget/bottom_nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({
    super.key,
    required this.tab,
  });
  static const String routeName = 'mainNavigation';

  final String tab;

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    'home',
    'discover',
    'profile',
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    // context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const MapScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const Scaffold(
              body: Center(
                child: Text("2"),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const ProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          bottom: 32,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavTab(
                text: '찾기',
                isSelected: _selectedIndex == 0,
                icon: Ionicons.map_outline,
                onTap: () => _onTap(0),
                selectedIndex: _selectedIndex,
              ),
              BottomNavTab(
                text: '알림',
                isSelected: _selectedIndex == 1,
                icon: Ionicons.notifications_outline,
                onTap: () => _onTap(1),
                selectedIndex: _selectedIndex,
              ),
              BottomNavTab(
                text: '프로필',
                isSelected: _selectedIndex == 2,
                icon: Ionicons.person_outline,
                onTap: () => _onTap(2),
                selectedIndex: _selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
