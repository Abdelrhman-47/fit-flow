import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/core/utils/onboarding_prefs.dart';
import 'package:fit_flow/featuers/home/ui/widgets/active_plan_card.dart';
import 'package:fit_flow/featuers/home/ui/widgets/home_header.dart';
import 'package:fit_flow/featuers/home/ui/widgets/home_stats.dart';
import 'package:fit_flow/featuers/home/ui/widgets/todays_exercises.dart';
import 'package:fit_flow/featuers/home/ui/widgets/weekly_blueprint.dart';
import 'package:fit_flow/featuers/onboarding/ui/logic/plans_cubit.dart';
import 'package:fit_flow/featuers/onboarding/ui/logic/plans_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadPlan();
  }

  Future<void> _loadPlan() async {
    final planId = await PrefHelpers.getPlanId();
    if (planId != null && mounted) {
      context.read<PlansCubit>().getPlanById(planId: planId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<PlansCubit, PlansState>(
          builder: (context, state) {
            if (state is PlansLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            } else if (state is PlansError) {
              return Center(
                child: Text('Error loading plan: ${state.error}',
                    style: const TextStyle(color: Colors.red)),
              );
            } else if (state is PlansSuccess) {
              final plan = state.plan;
              // Just picking the first day for "Today's Exercises"
              final today = plan.days.isNotEmpty ? plan.days.first : null;

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeader(),
                    const SizedBox(height: 24),
                    const WeeklyBlueprint(),
                    const SizedBox(height: 24),
                    ActivePlanCard(plan: plan),
                    const SizedBox(height: 24),
                    if (today != null) TodaysExercises(day: today),
                    const SizedBox(height: 24),
                    const HomeStats(),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            }
            return const Center(child: Text('No plan selected.'));
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textGrey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
