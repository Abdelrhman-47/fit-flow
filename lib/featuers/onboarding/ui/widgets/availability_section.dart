  import 'package:fit_flow/core/utils/app_text_style.dart';
import 'package:fit_flow/featuers/onboarding/data/models/onboarding_data.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/availability_chip.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/recommendation_card.dart';
import 'package:flutter/material.dart';

class AvailabilitySection extends StatelessWidget {
  const AvailabilitySection({
    super.key,
    required this.selectedAvailability,
    required this.onAvailabilitySelected,
  });

  final String selectedAvailability;
  final ValueChanged<String> onAvailabilitySelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weekly Availability',
          style: AppTextStyles.heading3Dark.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 38),
        Wrap(
          spacing: 16,
          children: OnboardingData.availabilityOptions.map((option) {
            return AvailabilityChip(
              label: option,
              isSelected: selectedAvailability == option,
              onTap: () => onAvailabilitySelected(option),
            );
          }).toList(),
        ),
        const SizedBox(height: 58),
        RecommendationCard(
          recommendation: OnboardingData.getRecommendation(
            selectedAvailability,
          ),
        ),
      ],
    );
  }
}
