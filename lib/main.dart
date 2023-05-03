import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:oduck/common/bottom_nav_bar.dart';
import 'package:oduck/config/theme.dart';
import 'package:oduck/features/profile/repo/darkmode_repo.dart';
import 'package:oduck/features/profile/view_model/darkMode_view_model.dart';
import 'package:oduck/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Try using const constructors as much as possible!

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final status = await Geolocator.checkPermission();
  if (status == LocationPermission.denied) {
    await Geolocator.requestPermission();
  }

  final preference = await SharedPreferences.getInstance();
  final repository = DarkModeRepository(preference);

  runApp(
    ProviderScope(
      overrides: [
        darkModeProvider.overrideWith(
          () => DarkModeViewModel(
            repository,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider).darkmode;

    return MaterialApp(
      title: 'Oduck',
      theme: whiteTheme,
      darkTheme: darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const MainNavigationScreen(
        tab: 'profile',
      ),
    );
  }
}
