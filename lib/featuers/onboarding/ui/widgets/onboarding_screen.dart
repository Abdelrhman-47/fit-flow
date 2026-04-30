import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/core/utils/onboarding_prefs.dart';
import 'package:fit_flow/featuers/onboarding/ui/logic/plans_cubit.dart';
import 'package:fit_flow/featuers/onboarding/ui/logic/plans_state.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/onboarding_body.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/plan_id_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int? _selectedGoal;
  String _selectedAvailability = '3 Days';

  void _onGoalSelected(int index) {
    setState(() => _selectedGoal = index);
  }

  void _onAvailabilitySelected(String option) {
    setState(() => _selectedAvailability = option);
  }

  Future<void> _onContinue() async {
    if (_selectedGoal == null) return;

    final planId = buildPlanId(
      goalIndex: _selectedGoal!,
      availability: _selectedAvailability,
    );

    await PrefHelpers.setPlanId(planId);

    context.read<PlansCubit>().getPlanById(planId: planId);
  }

  void _handleState(BuildContext context, PlansState state) async {
    if (state is PlansSuccess) {
      await PrefHelpers.setOnboardingCompleted();
      if (mounted) context.go('/home');
    } else if (state is PlansError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${state.error}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlansCubit, PlansState>(
      listener: _handleState,
      builder: (context, state) {
        final isLoading = state is PlansLoading;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                OnboardingBody(
                  selectedGoal: _selectedGoal,
                  selectedAvailability: _selectedAvailability,
                  isLoading: isLoading,
                  onGoalSelected: _onGoalSelected,
                  onAvailabilitySelected: _onAvailabilitySelected,
                  onContinue: _onContinue,
                ),
                if (isLoading) const _LoadingOverlay(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LoadingOverlay extends StatelessWidget {
  const _LoadingOverlay();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
    );
  }
}
