import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/core/utils/app_text_style.dart';
import 'package:fit_flow/featuers/onboarding/data/models/onboarding_data.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/goal_selection_card.dart';
import 'package:flutter/material.dart';

class GoalSection extends StatelessWidget {
  const GoalSection({
    super.key,
    required this.selectedGoal,
    required this.onGoalSelected,
  });

  final int? selectedGoal;
  final ValueChanged<int> onGoalSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Your Goal',
          style: AppTextStyles.heading1.copyWith(color: AppColors.textDark),
        ),
        const SizedBox(height: 8),
        Text(
          'Customize your journey for precision\nperformance.',
          style: AppTextStyles.bodyMedium,
        ),
        const SizedBox(height: 24),
        ...List.generate(OnboardingData.goals.length, (i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GoalSelectionCard(
              goal: OnboardingData.goals[i],
              isSelected: selectedGoal == i,
              onTap: () => onGoalSelected(i),
            ),
          );
        }),
      ],
    );
  }
}
