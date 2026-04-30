import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/core/utils/app_text_style.dart';
import 'package:fit_flow/featuers/onboarding/data/models/plan_model.dart';
import 'package:flutter/material.dart';

class ActivePlanCard extends StatelessWidget {
  final PlanModel plan;

  const ActivePlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    // Determine number of exercises in the first day (as a fallback)
    final numExercises = plan.days.isNotEmpty ? plan.days.first.exercises.length : 0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.inputBorder.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.fitness_center,
                  color: AppColors.primary,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'ACTIVE PLAN',
                style: AppTextStyles.label.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            plan.title.isNotEmpty ? plan.title : 'Upper Body Basics',
            style: AppTextStyles.heading2Dark.copyWith(
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.timer_outlined, size: 16, color: AppColors.textGrey),
              const SizedBox(width: 4),
              Text('45 Minutes', style: AppTextStyles.caption),
              const SizedBox(width: 16),
              const Icon(Icons.list_alt_outlined, size: 16, color: AppColors.textGrey),
              const SizedBox(width: 4),
              Text('$numExercises Exercises', style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Start Workout', style: AppTextStyles.buttonText),
                  const SizedBox(width: 8),
                  const Icon(Icons.play_arrow, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
