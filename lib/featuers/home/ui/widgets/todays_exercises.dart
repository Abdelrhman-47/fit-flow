import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/core/utils/app_text_style.dart';
import 'package:fit_flow/featuers/onboarding/data/models/plan_model.dart';
import 'package:flutter/material.dart';

class TodaysExercises extends StatelessWidget {
  final DayModel day;

  const TodaysExercises({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Exercises",
          style: AppTextStyles.bodyLargeDark.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),
        ...day.exercises.map((exercise) => _ExerciseTile(exercise: exercise)).toList(),
      ],
    );
  }
}

class _ExerciseTile extends StatelessWidget {
  final ExerciseModel exercise;

  const _ExerciseTile({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.fitness_center_outlined, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Chest & Triceps', // You might want to update your model to include muscle groups
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${exercise.sets} × ${exercise.reps}',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text('REPS', style: AppTextStyles.label.copyWith(letterSpacing: 1)),
            ],
          ),
        ],
      ),
    );
  }
}
