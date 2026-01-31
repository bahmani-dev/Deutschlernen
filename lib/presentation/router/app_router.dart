import 'package:flutter_application_1/presentation/screens/onboarding_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: 'onboarding',
        name: 'onboarding',
        builder: (context, state) => OnboardingScreen(),
      ),
    ],
  );
});
