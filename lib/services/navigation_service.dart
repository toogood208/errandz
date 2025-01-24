import 'package:errandz/features/authentication/login/login_screen.dart';
import 'package:errandz/features/onboarding_screen/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/splash_screen/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: "/onboarding",
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginScreen(),
    )
  ],
);
