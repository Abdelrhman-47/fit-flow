import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/core/utils/app_text_style.dart';
import 'package:fit_flow/core/utils/onboarding_prefs.dart';
import 'package:fit_flow/featuers/onboarding/data/models/onboarding_data.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/availability_chip.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/custom_onboarding_button.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/goal_selection_card.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/onboarding_header.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/recommendation_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int? _selectedGoal;
  String _selectedAvailability = '3 Days';

  Future<void> _continue() async {
    if (_selectedGoal == null) return;
    await PrefHelpers.setOnboardingCompleted();
    if (mounted) context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ────────────────────────────────────
              const OnboardingHeader(),
              const SizedBox(height: 28),

              // ── Title ─────────────────────────────────────
              Text('Select Your Goal',
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.textDark,
                  )),
              const SizedBox(height: 8),
              Text(
                'Customize your journey for precision\nperformance.',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: 24),

              // ── Goal cards ────────────────────────────────
              ...List.generate(OnboardingData.goals.length, (i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GoalSelectionCard(
                    goal: OnboardingData.goals[i],
                    isSelected: _selectedGoal == i,
                    onTap: () => setState(() => _selectedGoal = i),
                  ),
                );
              }),
              const SizedBox(height: 24),

              // ── Weekly Availability ───────────────────────
              Text('Weekly Availability',
                  style: AppTextStyles.heading3Dark.copyWith(fontSize: 18)),
              const SizedBox(height: 38),
              Wrap(
                spacing: 16,
                children: OnboardingData.availabilityOptions.map((option) {
                  return AvailabilityChip(
                    label: option,
                    isSelected: _selectedAvailability == option,
                    onTap: () =>
                        setState(() => _selectedAvailability = option),
                  );
                }).toList(),
              ),
              const SizedBox(height: 58),

              // ── Recommendation ────────────────────────────
              RecommendationCard(
                recommendation: OnboardingData.getRecommendation(
                    _selectedAvailability),
              ),
              const SizedBox(height: 170),

              // ── Continue button ───────────────────────────
              CustomOnboardingButton(
                label: 'Continue',
                onTap: _continue,
                enabled: _selectedGoal != null,
              ),
              const SizedBox(height: 12),

              // ── Footer note ───────────────────────────────
              Center(
                child: Text(
                  'YOU CAN CHANGE THIS LATER IN PROFILE',
                  style: AppTextStyles.caption.copyWith(
                    letterSpacing: 0.8,
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}