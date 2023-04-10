import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oduck/common/bottom_nav_bar.dart';

import 'config/theme.dart';

/// Try using const constructors as much as possible!

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final ThemeModeState currentTheme = ref.watch(themeProvider);

    return MaterialApp(

        /// Localization is not available for the title.
        title: 'Oduck',

        /// Theme stuff
        theme: lightTheme,
        darkTheme: darkTheme,
        // themeMode: currentTheme.themeMode,

        /// Localization stuff
        debugShowCheckedModeBanner: false,
        home: const MainNavigationScreen(
          tab: '찾기',
        ));
  }
}
