import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_flow/featuers/onboarding/data/models/plan_model.dart';

class FirestorePlansService {
  final FirebaseFirestore _firestore;

  FirestorePlansService(this._firestore);

  Future<PlanModel> getPlanById(String planId) async {
    final doc = await _firestore.collection('plans').doc(planId).get();
    if (doc.exists) {
      return PlanModel.fromMap(doc.data()!, doc.id);
    } else {
      throw Exception('Plan not found');
    }
  }

  Future<List<PlanModel>> getAllPlans() async {
    final querySnapshot = await _firestore.collection('plans').get();
    return querySnapshot.docs
        .map((doc) => PlanModel.fromMap(doc.data(), doc.id))
        .toList();
  }
}
