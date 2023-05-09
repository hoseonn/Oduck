import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'common/bottom_nav_bar.dart';
import 'features/authentication/repo/auth_repo.dart';
import 'features/authentication/view/login_screen.dart';

final routerProvider = Provider((ref) {
  // ref.watch(authState);
  return GoRouter(
    initialLocation: "/login",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.subloc != LoginScreen.routeURL) {
          return LoginScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeURL,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/:tab(map|news|profile)",
        name: MainNavigationScreen.routeName,
        builder: (context, state) {
          final tab = state.params["tab"]!;
          return MainNavigationScreen(tab: tab);
        },
      ),
    ],
  );
});
