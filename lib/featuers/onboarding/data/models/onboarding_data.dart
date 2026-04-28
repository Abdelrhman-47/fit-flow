import 'package:flutter/material.dart';
import 'onboarding_model.dart';

class OnboardingData {
  static const List<GoalModel> goals = [
    GoalModel(
      title: 'Build Muscle',
      subtitle: 'Focus on hypertrophy and strength.',
      icon: Icons.fitness_center_rounded,
    ),
    GoalModel(
      title: 'Get Strong',
      subtitle: 'Prioritize heavy lifting and power.',
      icon: Icons.shield_rounded,
    ),
    GoalModel(
      title: 'General Fitness',
      subtitle: 'Balanced health and mobility.',
      icon: Icons.directions_run_rounded,
    ),
  ];

  static const List<String> availabilityOptions = [
    '2 Days',
    '3 Days',
    '4 Days',
    '5+ Days',
  ];

  static String getRecommendation(String availability) {
    switch (availability) {
      case '2 Days':
        return 'Efficient full-body sessions';
      case '3 Days':
        return 'Optimal recovery cycle';
      case '4 Days':
        return 'Upper/lower split training';
      case '5+ Days':
        return 'Advanced split programming';
      default:
        return 'Optimal recovery cycle';
    }
  }
}
