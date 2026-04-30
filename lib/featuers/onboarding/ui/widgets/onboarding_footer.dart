import 'package:fit_flow/core/utils/app_text_style.dart';
import 'package:fit_flow/featuers/onboarding/ui/widgets/custom_onboarding_button.dart';
import 'package:flutter/material.dart';

class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({
    super.key,
    required this.isLoading,
    required this.isEnabled,
    required this.onContinue,
  });

  final bool isLoading;
  final bool isEnabled;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOnboardingButton(
          label: 'Continue',
          onTap: isLoading ? () {} : onContinue,
          enabled: isEnabled,
        ),
        const SizedBox(height: 12),
        Center(
          child: Text(
            'YOU CAN CHANGE THIS LATER IN PROFILE',
            style: AppTextStyles.caption.copyWith(
              letterSpacing: 0.8,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
