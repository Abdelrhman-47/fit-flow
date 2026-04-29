import 'package:dartz/dartz.dart';
import 'package:fit_flow/core/utils/failure.dart';
import 'package:fit_flow/featuers/onboarding/data/models/plan_model.dart';
import 'package:fit_flow/featuers/onboarding/data/services/firestore_plans_service.dart';

abstract class PlansRepo {
  Future<Either<Failure, PlanModel>> getPlanById(String planId);
  Future<Either<Failure, List<PlanModel>>> getAllPlans();
}

class FirestorePlansRepoImpl implements PlansRepo {
  final FirestorePlansService _firestorePlansService;

  FirestorePlansRepoImpl({required FirestorePlansService firestorePlansService})
      : _firestorePlansService = firestorePlansService;

  @override
  Future<Either<Failure, PlanModel>> getPlanById(String planId) async {
    try {
      final plan = await _firestorePlansService.getPlanById(planId);
      return right(plan);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PlanModel>>> getAllPlans() async {
    try {
      final plans = await _firestorePlansService.getAllPlans();
      return right(plans);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
