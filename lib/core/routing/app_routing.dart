import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_flow/featuers/auth/ui/views/auth_view.dart';
import 'package:fit_flow/featuers/home/ui/views/home_view.dart';
import 'package:fit_flow/featuers/onboarding/data/repo/plans_repo.dart';
import 'package:fit_flow/featuers/onboarding/data/services/firestore_plans_service.dart';
import 'package:fit_flow/featuers/onboarding/ui/logic/plans_cubit.dart';
import 'package:fit_flow/featuers/onboarding/ui/views/onboarding_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      GoRoute(
        path: '/home',
        builder: (context, state) => BlocProvider(
          create: (_) => PlansCubit(
            plansRepo: FirestorePlansRepoImpl(
              firestorePlansService: FirestorePlansService(
                FirebaseFirestore.instance,
              ),
            ),
          ),
          child: const HomeView(),
        ),
      ),
    ],
  );
}
