import 'package:fit_flow/featuers/onboarding/data/models/plan_model.dart';

abstract class PlansState {}

class PlansInitial extends PlansState {}

class PlansLoading extends PlansState {}

class PlansSuccess extends PlansState {
  final PlanModel plan;
  PlansSuccess(this.plan);
}

class AllPlansSuccess extends PlansState {
  final List<PlanModel> plans;
  AllPlansSuccess(this.plans);
}

class PlansError extends PlansState {
  final String error;
  PlansError(this.error);
}
