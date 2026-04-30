import 'package:fit_flow/featuers/onboarding/ui/widgets/availability_section.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/goal_section.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/onboarding_footer.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/onboarding_header.dart';
import 'package:flutter/material.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.selectedGoal,
    required this.selectedAvailability,
    required this.isLoading,
    required this.onGoalSelected,
    required this.onAvailabilitySelected,
    required this.onContinue,
  });

  final int? selectedGoal;
  final String selectedAvailability;
  final bool isLoading;
  final ValueChanged<int> onGoalSelected;
  final ValueChanged<String> onAvailabilitySelected;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OnboardingHeader(),
          const SizedBox(height: 28),
          GoalSection(
            selectedGoal: selectedGoal,
            onGoalSelected: onGoalSelected,
          ),
          const SizedBox(height: 24),
          AvailabilitySection(
            selectedAvailability: selectedAvailability,
            onAvailabilitySelected: onAvailabilitySelected,
          ),
          const SizedBox(height: 170),
          OnboardingFooter(
            isLoading: isLoading,
            isEnabled: selectedGoal != null && !isLoading,
            onContinue: onContinue,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
