// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fit_flow/core/utils/app_color.dart';
// import 'package:fit_flow/core/utils/app_text_style.dart';
// import 'package:fit_flow/core/utils/onboarding_prefs.dart';
// import 'package:fit_flow/featuers/onboarding/data/models/onboarding_data.dart';
// import 'package:fit_flow/featuers/onboarding/data/repo/plans_repo.dart';
// import 'package:fit_flow/featuers/onboarding/data/services/firestore_plans_service.dart';
// import 'package:fit_flow/featuers/onboarding/ui/logic/plans_cubit.dart';
// import 'package:fit_flow/featuers/onboarding/ui/logic/plans_state.dart';
// import 'package:fit_flow/featuers/onboarding/ui/widgets/availability_chip.dart';
// import 'package:fit_flow/featuers/onboarding/ui/widgets/custom_onboarding_button.dart';
// import 'package:fit_flow/featuers/onboarding/ui/widgets/goal_selection_card.dart';
// import 'package:fit_flow/featuers/onboarding/ui/widgets/onboarding_header.dart';
// import 'package:fit_flow/featuers/onboarding/ui/widgets/recommendation_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// class OnBoardingView extends StatefulWidget {
//   const OnBoardingView({super.key});

//   @override
//   State<OnBoardingView> createState() => _OnBoardingViewState();
// }

// class _OnBoardingViewState extends State<OnBoardingView> {
//   int? _selectedGoal;
//   String _selectedAvailability = '3 Days';

//   String _getPlanId() {
//     String goal = '';
//     switch (_selectedGoal) {
//       case 0:
//         goal = 'muscle';
//         break;
//       case 1:
//         goal = 'strong';
//         break;
//       case 2:
//         goal = 'fitness';
//         break;
//     }

//     String days = _selectedAvailability.split(' ')[0];
//     if (days == '5+') days = '5';

//     return '${goal}_${days}_days';
//   }

//   Future<void> _continue(BuildContext context) async {
//     if (_selectedGoal == null) return;

//     final planId = _getPlanId();
//     print('Requesting plan data for: $planId');

//     // Trigger the cubit to fetch data
//     context.read<PlansCubit>().getPlanById(planId: planId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => PlansCubit(
//         plansRepo: FirestorePlansRepoImpl(
//           firestorePlansService: FirestorePlansService(
//             FirebaseFirestore.instance,
//           ),
//         ),
//       ),
//       child: BlocConsumer<PlansCubit, PlansState>(
//         listener: (context, state) async {
//           if (state is PlansSuccess) {
//             print('Plan data fetched successfully: ${state.plan.title}');
//             await PrefHelpers.setOnboardingCompleted();
//             if (mounted) context.go('/home');
//           } else if (state is PlansError) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Error: ${state.error}'),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             backgroundColor: Colors.white,
//             body: SafeArea(
//               child: Stack(
//                 children: [
//                   SingleChildScrollView(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 24,
//                       vertical: 16,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const OnboardingHeader(),
//                         const SizedBox(height: 28),
//                         Text(
//                           'Select Your Goal',
//                           style: AppTextStyles.heading1.copyWith(
//                             color: AppColors.textDark,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           'Customize your journey for precision\nperformance.',
//                           style: AppTextStyles.bodyMedium,
//                         ),
//                         const SizedBox(height: 24),
//                         ...List.generate(OnboardingData.goals.length, (i) {
//                           return Padding(
//                             padding: const EdgeInsets.only(bottom: 12),
//                             child: GoalSelectionCard(
//                               goal: OnboardingData.goals[i],
//                               isSelected: _selectedGoal == i,
//                               onTap: () => setState(() => _selectedGoal = i),
//                             ),
//                           );
//                         }),
//                         const SizedBox(height: 24),
//                         Text(
//                           'Weekly Availability',
//                           style: AppTextStyles.heading3Dark.copyWith(
//                             fontSize: 18,
//                           ),
//                         ),
//                         const SizedBox(height: 38),
//                         Wrap(
//                           spacing: 16,
//                           children: OnboardingData.availabilityOptions.map((
//                             option,
//                           ) {
//                             return AvailabilityChip(
//                               label: option,
//                               isSelected: _selectedAvailability == option,
//                               onTap: () => setState(
//                                 () => _selectedAvailability = option,
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                         const SizedBox(height: 58),
//                         RecommendationCard(
//                           recommendation: OnboardingData.getRecommendation(
//                             _selectedAvailability,
//                           ),
//                         ),
//                         const SizedBox(height: 170),
//                         CustomOnboardingButton(
//                           label: 'Continue',
//                           onTap: state is PlansLoading
//                               ? () {
//                                   return;
//                                 }
//                               : () => _continue(context),
//                           enabled:
//                               _selectedGoal != null && state is! PlansLoading,
//                         ),
//                         const SizedBox(height: 12),
//                         Center(
//                           child: Text(
//                             'YOU CAN CHANGE THIS LATER IN PROFILE',
//                             style: AppTextStyles.caption.copyWith(
//                               letterSpacing: 0.8,
//                               fontSize: 10,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                       ],
//                     ),
//                   ),
//                   if (state is PlansLoading)
//                     Container(
//                       color: Colors.black.withOpacity(0.3),
//                       child: const Center(
//                         child: CircularProgressIndicator(
//                           color: AppColors.primary,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
