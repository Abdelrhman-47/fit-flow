import 'package:fit_flow/core/utils/di_helper.dart';
import 'package:fit_flow/featuers/onboarding/ui/logic/plans_cubit.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PlansCubit>(),
      child: const OnboardingScreen(),
    );
  }
}

