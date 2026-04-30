import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_flow/featuers/onboarding/data/repo/plans_repo.dart';
import 'package:fit_flow/featuers/onboarding/data/services/firestore_plans_service.dart';
import 'package:fit_flow/featuers/onboarding/ui/logic/plans_cubit.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlansCubit(
        plansRepo: FirestorePlansRepoImpl(
          firestorePlansService: FirestorePlansService(
            FirebaseFirestore.instance,
          ),
        ),
      ),
      child: const OnboardingScreen(),
    );
  }
}
