import 'package:fit_flow/featuers/auth/ui/views/auth_view.dart';
import 'package:fit_flow/featuers/home/ui/views/home_view.dart';
import 'package:fit_flow/featuers/onboarding/ui/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static final GoRouter router = GoRouter(
    initialLocation: '/auth',
    routes: [
      GoRoute(path: '/auth', builder: (context, state) => const AuthScreen()),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(path: '/home', builder: (context, state) => const HomeView()),
    ],
  );
}
