import 'package:fit_flow/featuers/onboarding/data/repo/plans_repo.dart';
import 'package:fit_flow/featuers/onboarding/ui/logic/plans_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlansCubit extends Cubit<PlansState> {
  final PlansRepo _plansRepo;

  PlansCubit({required PlansRepo plansRepo})
      : _plansRepo = plansRepo,
        super(PlansInitial());

  Future<void> getPlanById({required String planId}) async {
    emit(PlansLoading());
    final result = await _plansRepo.getPlanById(planId);
    result.fold(
      (failure) => emit(PlansError(failure.message)),
      (plan) => emit(PlansSuccess(plan)),
    );
  }

  Future<void> getAllPlans() async {
    emit(PlansLoading());
    final result = await _plansRepo.getAllPlans();
    result.fold(
      (failure) => emit(PlansError(failure.message)),
      (plans) => emit(AllPlansSuccess(plans)),
    );
  }
}
